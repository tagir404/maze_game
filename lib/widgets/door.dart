import 'package:flutter/material.dart';
import 'package:maze_game/models/maze_door.dart';

class Door extends StatelessWidget {
  const Door({
    required this.door,
    required this.isRequired,
    required this.isOpened,
    required this.left,
    super.key,
  });

  final MazeDoor door;
  final bool isRequired;
  final bool isOpened;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: 54,
      child: Column(
        children: [
          Container(
            width: 68,
            height: 112,
            decoration: BoxDecoration(
              color: door.color,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(34),
              ),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.82),
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: door.color.withValues(alpha: 0.45),
                  blurRadius: 18,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              isOpened ? Icons.check_circle_rounded : Icons.circle,
              color: Colors.white.withValues(alpha: 0.86),
            ),
          ),
          const SizedBox(height: 8),
          Text(door.label, style: const TextStyle(fontWeight: FontWeight.w700)),
          if (isRequired)
            Text(
              isOpened ? 'открыта' : 'нужная',
              style: TextStyle(
                color: isOpened ? Colors.greenAccent : Colors.amberAccent,
                fontSize: 12,
              ),
            ),
        ],
      ),
    );
  }
}
