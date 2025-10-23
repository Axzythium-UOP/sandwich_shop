import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: const Center(
          child: Text('Welcome to the Sandwich Shop!'),
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemName;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('This is a placehold for OrderItemDisplay');
  }
}
