import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sandwich Shop App',
      home: OrderScreen(maxQuantity: 5),
    );
  }
}

class OrderScreen extends StatefulWidget {
  final int maxQuantity;

  const OrderScreen({super.key, this.maxQuantity = 10});

  @override
  State<OrderScreen> createState() {
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _increaseQuantity() {
    final note = _noteController.text.trim();
    if (_quantity < widget.maxQuantity) {
      setState(() => _quantity++);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Added 1 Footlong${note.isNotEmpty ? ' — Note: $note' : ''}'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Maximum quantity reached')),
      );
    }
  }

  void _decreaseQuantity() {
    final note = _noteController.text.trim();
    if (_quantity > 0) {
      setState(() => _quantity--);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Removed 1 Footlong${note.isNotEmpty ? ' — Note: $note' : ''}'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No sandwiches to remove')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sandwich Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              _quantity,
              'Footlong',
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  labelText: 'Order note',
                  hintText: 'e.g., no onions, extra pickles',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledButton(
                  label: 'Add',
                  icon: Icons.add,
                  onPressed: (_quantity < widget.maxQuantity)
                      ? _increaseQuantity
                      : null,
                ),
                const SizedBox(width: 12),
                StyledButton(
                  label: 'Remove',
                  icon: Icons.remove,
                  onPressed: (_quantity > 0) ? _decreaseQuantity : null,
                ),
              ],
            ),
          ],
        ),
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
      style: const TextStyle(color: Colors.black, fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}

/// A reusable styled ElevatedButton with icon and label to avoid repetition.
class StyledButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  const StyledButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Resolve colors depending on enabled/disabled states for clearer feedback.
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.black,
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ).copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.disabled))
          return Colors.blue.shade200;
        return Colors.blue;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.disabled)) return Colors.black45;
        return Colors.black;
      }),
    );

    final iconColor = onPressed != null ? Colors.black : Colors.black45;

    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
