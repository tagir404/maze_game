import 'package:flutter/material.dart';

class MazeDoor {
  const MazeDoor({
    required this.id,
    required this.label,
    required this.color,
    required this.targetRoomId,
  });

  final int id;
  final String label;
  final Color color;
  final int targetRoomId;
}
