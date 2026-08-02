import 'package:flutter/material.dart';

class RoomBackground extends StatelessWidget {
  const RoomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: .all(.circular(18)),
        gradient: LinearGradient(
          colors: [Color(0xFF29345E), Color(0xFF15192E)],
          begin: .topLeft,
          end: .bottomRight,
        ),
      ),
    );
  }
}
