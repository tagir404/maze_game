import 'package:flutter/material.dart';

class CoinsDisplay extends StatelessWidget {
  const CoinsDisplay({required this.quantity, super.key});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.diamond, color: Theme.of(context).colorScheme.primary),
        Text(quantity.toString()),
      ],
    );
  }
}
