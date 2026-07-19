import 'package:flutter/material.dart';
import 'package:maze_game/common/constants.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constants.playerSize;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: const Color(0xFFFFD2A6),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.brown, width: 2),
          ),
          child: const Stack(
            children: [
              Positioned(left: 6, top: 10, child: _Eye()),
              Positioned(right: 6, top: 10, child: _Eye()),
            ],
          ),
        ),

        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [_Leg(), SizedBox(width: 6), _Leg()],
        ),
      ],
    );
  }
}

class _Eye extends StatelessWidget {
  const _Eye();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 6,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Leg extends StatelessWidget {
  const _Leg();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.brown,
        borderRadius: .only(
          bottomLeft: .circular(2),
          bottomRight: .circular(2),
        ),
      ),
    );
  }
}
