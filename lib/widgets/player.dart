import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
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
        Container(
          width: 44,
          height: 54,
          decoration: BoxDecoration(
            color: const Color(0xFF64D2FF),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ],
    );
  }
}
