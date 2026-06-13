import 'package:flutter/material.dart';

class RoomBackground extends StatelessWidget {
  const RoomBackground({super.key, required this.roomName});

  final String roomName;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        gradient: LinearGradient(
          colors: [Color(0xFF29345E), Color(0xFF15192E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 22, top: 18),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            roomName,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.10),
              fontSize: 42,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
