import 'package:flutter/material.dart';
import 'package:maze_game/common/constants.dart';
import 'package:maze_game/models/maze_door.dart';

class Door extends StatelessWidget {
  const Door({required this.door, required this.left, super.key});

  final MazeDoor door;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: 0,
      child: Column(
        children: [
          Container(
            width: Constants.doorWidth,
            height: Constants.doorHeight,
            decoration: BoxDecoration(
              color: door.color,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withValues(alpha: 0.82),
                  width: 3,
                ),
                left: BorderSide(
                  color: Colors.white.withValues(alpha: 0.82),
                  width: 3,
                ),
                right: BorderSide(
                  color: Colors.white.withValues(alpha: 0.82),
                  width: 3,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: door.color.withValues(alpha: 0.45),
                  blurRadius: 18,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
