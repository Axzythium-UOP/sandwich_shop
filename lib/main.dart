import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sandwich Shop App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Sandwich Counter')),
        body: const SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 150,
              child: OrderItemDisplayRow(),
            ),
          ),
        ),
      ),
    );
  }
}

class OrderItemDisplayRow extends StatelessWidget {
  const OrderItemDisplayRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          OrderItemDisplay(3, 'BLT'),
          OrderItemDisplay(5, 'Club'),
          OrderItemDisplay(2, 'Veggie'),
        ],
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final int quantity;
  final String itemType;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    final sandwiches = List.filled(quantity, '🥪').join();
    return Text(
      '$quantity $itemType sandwich(es): $sandwiches',
      style: const TextStyle(color: Colors.white, fontSize: 16),
      textAlign: TextAlign.center,
    );
  }
}
