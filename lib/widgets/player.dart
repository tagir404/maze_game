import 'package:flutter/material.dart';
import 'package:maze_game/common/constants.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Constants.playerSize,
          height: Constants.playerSize,
          decoration: const BoxDecoration(
            color: Color(0xFFFFD2A6),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.face_rounded,
            color: Color(0xFF4A2B22),
            size: 24,
          ),
        ),
      ],
    );
  }
}
