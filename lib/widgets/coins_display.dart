import 'package:flutter/material.dart';

class CoinsDisplay extends StatelessWidget {
  const CoinsDisplay({required this.quantity, super.key});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Text(quantity.toString()),
        const Icon(Icons.diamond, color: Color(0xFFF3BF45)),
      ],
    );
  }
}
