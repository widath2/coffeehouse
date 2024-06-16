import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

void main() {
  runApp(MaterialApp(
    home: PricesPage(),
  ));
}

class PricesPage extends StatefulWidget {
  @override
  _PricesPageState createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {
  List<dynamic> coffees = [];
  bool isLoading = true;
  GlobalKey globalKey = GlobalKey();
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    _checkConnectivity(); // Check connectivity on init
    fetchCoffeePrices();
  }

  Future<void> fetchCoffeePrices() async {
    final url = 'https://coffee.alexflipnote.dev/random.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          var jsonData = json.decode(response.body);
          if (jsonData != null) {
            coffees = [jsonData]; // Wrap jsonData in a list if necessary
          } else {
            coffees = []; // Handle empty response or null case
          }
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching coffee prices: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isOffline = true;
      });
    } else {
      setState(() {
        isOffline = false;
      });
    }

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        isOffline = result == ConnectivityResult.none;
      });
      if (!isOffline) {
        fetchCoffeePrices(); // Re-fetch data when connection is restored
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Prices'),
        centerTitle: true,
        backgroundColor: Colors.brown[700],
        actions: [
          IconButton(
            icon: Icon(Icons.download_rounded),
            onPressed: () {
              // Implement save as image functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.picture_as_pdf_rounded),
            onPressed: () {
              // Implement save as PDF functionality
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Visibility(
            visible: isLoading,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Visibility(
            visible: !isLoading && !isOffline,
            child: ListView.builder(
              itemCount: coffees.length,
              itemBuilder: (context, index) {
                var coffee = coffees[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        coffee['name'] ?? 'Unknown',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            'Type: ${coffee['type'] ?? 'Unknown'}',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Origin: ${coffee['country'] ?? 'Unknown'}',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'Price: \$${coffee['price'] ?? 'Unknown'}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Visibility(
            visible: isOffline,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You are offline',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      _checkConnectivity(); // Check connectivity again
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
