import 'package:flutter/material.dart';
import 'package:maze_game/common/constants.dart';
import 'package:maze_game/models/maze_door.dart';

class Door extends StatelessWidget {
  const Door({
    required this.door,
    required this.left,
    required this.isHint,
    super.key,
  });

  final MazeDoor door;
  final double left;
  final bool isHint;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
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

                boxShadow: isHint
                    ? [
                        BoxShadow(
                          color: Colors.yellow.withValues(alpha: 0.6),
                          blurRadius: 18,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
              ),

              child: isHint
                  ? Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.yellow.withValues(alpha: 0.9),
                          size: 22,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
