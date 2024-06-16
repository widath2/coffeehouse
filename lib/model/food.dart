import 'package:flutter/material.dart';

class Coffee {
  Coffee({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rating,
    required this.preparationTime,
    required this.description,
  });

  final String id;
  final String image;
  final String name;
  final int price;
  final double rating;
  final String preparationTime;
  final String description;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Coffee Shop'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (var coffee in dummyCoffees) CoffeeCard(coffee: coffee),
            ],
          ),
        ),
      ),
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;

  const CoffeeCard({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(coffee.image,
              height: 150, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coffee.name,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Price: \$${coffee.price} | Rating: ${coffee.rating}'),
                SizedBox(height: 8),
                Text('Preparation Time: ${coffee.preparationTime}'),
                SizedBox(height: 8),
                Text(coffee.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// List of dummy coffees for testing
final dummyCoffees = [
  Coffee(
    id: '1',
    image: 'assets/cappuccino.jpg',
    name: 'Espresso',
    price: 250,
    rating: 4.5,
    preparationTime: '3 minutes',
    description:
        'Espresso is a concentrated coffee drink brewed by forcing hot water under pressure through finely-ground coffee beans. It has a strong flavor and a thick, creamy consistency known as crema. Espresso forms the base for various coffee beverages like cappuccino, latte, and macchiato.',
  ),
  Coffee(
    id: '2',
    image: 'assets/latte.jpg',
    name: 'Cappuccino',
    price: 350,
    rating: 4.8,
    preparationTime: '5 minutes',
    description:
        'Cappuccino is n.',
  ),
  Coffee(
    id: '3',
    image: 'assets/new.jpg',
    name: 'Latte',
    price: 300,
    rating: 4.6,
    preparationTime: '4 minutes',
    description:
        'Lt on top.',
  ),
  Coffee(
    id: '4',
    image: 'assets/logo.jpg',
    name: 'Americano',
    price: 280,
    rating: 4.4,
    preparationTime: '3 minutes',
    description:
        'Americano is a diluted coffee drink made by adding hot water to espresso. It has a similar strength to drip coffee but retains the flavor profile of espresso. Americanos can be enjoyed black or with added milk or sweeteners according to personal preference.',
  ),
];

void main() {
  runApp(MyApp());
}
