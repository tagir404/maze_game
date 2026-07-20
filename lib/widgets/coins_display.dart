import 'package:flutter/material.dart';
import 'package:maze_game/theme/app_colors.dart';

class CoinsDisplay extends StatelessWidget {
  const CoinsDisplay({required this.quantity, super.key});

  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.diamond, color: Theme.of(context).appColors.coins),
        Text(quantity.toString()),
      ],
    );
  }
}
