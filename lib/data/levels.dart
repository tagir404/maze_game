import 'package:flutter/material.dart';
import 'package:maze_game/models/maze_door.dart';
import 'package:maze_game/models/maze_level.dart';
import 'package:maze_game/models/maze_room.dart';

const List<MazeLevel> levels = [
  MazeLevel(
    rooms: [
      MazeRoom(
        id: 1,
        doors: [
          MazeDoor(color: Color(0xFFE94F5E), targetRoomId: 2),
          MazeDoor(color: Color(0xFF3C7BFF), targetRoomId: 1),
        ],
      ),
      MazeRoom(
        id: 2,
        doors: [
          MazeDoor(color: Color(0xFF37C978), targetRoomId: 1),
          MazeDoor(color: Color(0xFF9B5CFF), targetRoomId: 3),
        ],
      ),
      MazeRoom(
        id: 3,
        doors: [MazeDoor(color: Color(0xFFF3BF45), targetRoomId: 0)],
      ),
      MazeRoom(id: 0, doors: []),
    ],
  ),
  MazeLevel(
    rooms: [
      MazeRoom(
        id: 1,
        doors: [
          MazeDoor(color: Color(0xFF37C978), targetRoomId: 2),
          MazeDoor(color: Color(0xFF3C7BFF), targetRoomId: 4),
          MazeDoor(color: Color(0xFFFF8A3D), targetRoomId: 1),
        ],
      ),
      MazeRoom(
        id: 2,
        doors: [
          MazeDoor(color: Color(0xFFE94F5E), targetRoomId: 3),
          MazeDoor(color: Color(0xFF3C7BFF), targetRoomId: 1),
        ],
      ),
      MazeRoom(
        id: 3,
        doors: [
          MazeDoor(color: Color(0xFFF3BF45), targetRoomId: 0),
          MazeDoor(color: Color(0xFF37C978), targetRoomId: 4),
        ],
      ),
      MazeRoom(
        id: 4,
        doors: [
          MazeDoor(color: Color(0xFF9B5CFF), targetRoomId: 2),
          MazeDoor(color: Color(0xFFE94F5E), targetRoomId: 1),
        ],
      ),
      MazeRoom(id: 0, doors: []),
      MazeRoom(
        id: 5,
        doors: [MazeDoor(color: Color(0xFF3C7BFF), targetRoomId: 3)],
      ),
    ],
  ),
  MazeLevel(
    rooms: [
      MazeRoom(
        id: 1,
        doors: [
          MazeDoor(color: Color(0xFFE94F5E), targetRoomId: 2),
          MazeDoor(color: Color(0xFFF3BF45), targetRoomId: 4),
        ],
      ),
      MazeRoom(
        id: 2,
        doors: [
          MazeDoor(color: Color(0xFF9B5CFF), targetRoomId: 3),
          MazeDoor(color: Color(0xFF37C978), targetRoomId: 1),
          MazeDoor(color: Color(0xFFFF8A3D), targetRoomId: 5),
        ],
      ),
      MazeRoom(
        id: 3,
        doors: [
          MazeDoor(color: Color(0xFF37C978), targetRoomId: 4),
          MazeDoor(color: Color(0xFFE94F5E), targetRoomId: 6),
        ],
      ),
      MazeRoom(
        id: 4,
        doors: [
          MazeDoor(color: Color(0xFF3C7BFF), targetRoomId: 0),
          MazeDoor(color: Color(0xFFF3BF45), targetRoomId: 2),
        ],
      ),
      MazeRoom(
        id: 5,
        doors: [MazeDoor(color: Color(0xFF3C7BFF), targetRoomId: 3)],
      ),
      MazeRoom(
        id: 6,
        doors: [
          MazeDoor(color: Color(0xFF9B5CFF), targetRoomId: 1),
          MazeDoor(color: Color(0xFF37C978), targetRoomId: 5),
        ],
      ),
      MazeRoom(id: 0, doors: []),
      MazeRoom(
        id: 7,
        doors: [MazeDoor(color: Color(0xFFE94F5E), targetRoomId: 1)],
      ),
    ],
  ),
  MazeLevel(
    rooms: [
      MazeRoom(
        id: 1,
        doors: [
          MazeDoor(color: Color(0xFFE94F5E), targetRoomId: 2),
          MazeDoor(color: Colors.white, targetRoomId: 3),
          MazeDoor(color: Colors.amber, targetRoomId: 4),
          MazeDoor(color: Colors.amberAccent, targetRoomId: 5),
        ],
      ),
      MazeRoom(
        id: 2,
        doors: [
          MazeDoor(color: Colors.lightBlue, targetRoomId: 1),
          MazeDoor(color: Colors.lime, targetRoomId: 3),
        ],
      ),
      MazeRoom(
        id: 3,
        doors: [
          MazeDoor(color: Colors.purple, targetRoomId: 1),
          MazeDoor(color: Colors.purple, targetRoomId: 2),
        ],
      ),
      MazeRoom(id: 5, doors: [MazeDoor(color: Colors.pink, targetRoomId: 2)]),
      MazeRoom(
        id: 4,
        doors: [
          MazeDoor(color: Colors.deepOrange, targetRoomId: 3),
          MazeDoor(color: Colors.indigo, targetRoomId: 0),
          MazeDoor(color: Colors.greenAccent, targetRoomId: 1),
        ],
      ),
      MazeRoom(id: 0, doors: []),
    ],
  ),
  MazeLevel(
    rooms: [
      MazeRoom(
        id: 1,
        doors: [
          MazeDoor(color: Colors.teal, targetRoomId: 2),
          MazeDoor(color: Colors.teal, targetRoomId: 3),
          MazeDoor(color: Colors.teal, targetRoomId: 4),
        ],
      ),
      MazeRoom(
        id: 2,
        doors: [
          MazeDoor(color: Colors.amberAccent, targetRoomId: 3),
          MazeDoor(color: Colors.amberAccent, targetRoomId: 1),
        ],
      ),
      MazeRoom(
        id: 3,
        doors: [
          MazeDoor(color: Color(0xFF127D16), targetRoomId: 2),
          MazeDoor(color: Color(0xFF127D16), targetRoomId: 7),
        ],
      ),
      MazeRoom(
        id: 4,
        doors: [
          MazeDoor(color: Color(0xFF7F4D75), targetRoomId: 5),
          MazeDoor(color: Color(0xFF5A3759), targetRoomId: 6),
        ],
      ),
      MazeRoom(id: 5, doors: [MazeDoor(color: Colors.orange, targetRoomId: 8)]),
      MazeRoom(
        id: 6,
        doors: [
          MazeDoor(color: Colors.grey, targetRoomId: 3),
          MazeDoor(color: Color(0xFF0C64AB), targetRoomId: 0),
        ],
      ),
      MazeRoom(id: 7, doors: [MazeDoor(color: Colors.white, targetRoomId: 5)]),
      MazeRoom(
        id: 8,
        doors: [
          MazeDoor(color: Colors.amberAccent, targetRoomId: 5),
          MazeDoor(color: Colors.amberAccent, targetRoomId: 3),
        ],
      ),
      MazeRoom(id: 0, doors: []),
    ],
  ),
  MazeLevel(
    rooms: [
      MazeRoom(
        id: 1,
        doors: [
          MazeDoor(color: Color(0xFF37C978), targetRoomId: 2),
          MazeDoor(color: Color(0xFFF3BF45), targetRoomId: 3),
        ],
      ),
      MazeRoom(
        id: 2,
        doors: [
          MazeDoor(color: Color(0xFFFF8A3D), targetRoomId: 1),
          MazeDoor(color: Color(0xFF00B8A9), targetRoomId: 4),
          MazeDoor(color: Color(0xFFF3BF45), targetRoomId: 3),
        ],
      ),
      MazeRoom(
        id: 3,
        doors: [
          MazeDoor(color: Color(0xFFEF476F), targetRoomId: 1),
          MazeDoor(color: Color(0xFF06D6A0), targetRoomId: 4),
          MazeDoor(color: Color(0xFF118AB2), targetRoomId: 2),
        ],
      ),
      MazeRoom(
        id: 4,
        doors: [
          MazeDoor(color: Color(0xFF118AB2), targetRoomId: 5),
          MazeDoor(color: Color(0xFF06D6A0), targetRoomId: 2),
          MazeDoor(color: Color(0xFFFFD166), targetRoomId: 6),
        ],
      ),
      MazeRoom(
        id: 5,
        doors: [
          MazeDoor(color: Color(0xFFFFD166), targetRoomId: 1),
          MazeDoor(color: Color(0xFF8338EC), targetRoomId: 2),
          MazeDoor(color: Color(0xFFFB5607), targetRoomId: 1),
        ],
      ),
      MazeRoom(
        id: 6,
        doors: [
          MazeDoor(color: Color(0xFFFB5607), targetRoomId: 11),
          MazeDoor(color: Color(0xFF4CC9F0), targetRoomId: 4),
          MazeDoor(color: Color(0xFFB5179E), targetRoomId: 7),
          MazeDoor(color: Color(0xFFE94F5E), targetRoomId: 1),
        ],
      ),
      MazeRoom(
        id: 11,
        doors: [MazeDoor(color: Colors.orange, targetRoomId: 2)],
      ),
      MazeRoom(
        id: 7,
        doors: [
          MazeDoor(color: Color(0xFFB5179E), targetRoomId: 8),
          MazeDoor(color: Color(0xFFE94F5E), targetRoomId: 5),
        ],
      ),
      MazeRoom(
        id: 8,
        doors: [
          MazeDoor(color: Color(0xFF3C7BFF), targetRoomId: 9),
          MazeDoor(color: Color(0xFF37C978), targetRoomId: 6),
        ],
      ),
      MazeRoom(
        id: 9,
        doors: [
          MazeDoor(color: Color(0xFFF3BF45), targetRoomId: 7),
          MazeDoor(color: Color(0xFF00B8A9), targetRoomId: 1),
          MazeDoor(color: Color(0xFF9B5CFF), targetRoomId: 10),
        ],
      ),
      MazeRoom(
        id: 10,
        doors: [
          MazeDoor(color: Color(0xFFFF8A3D), targetRoomId: 0),
          MazeDoor(color: Color(0xFF00B8A9), targetRoomId: 11),
        ],
      ),
      MazeRoom(id: 0, doors: []),
    ],
    isPremium: true,
  ),
  MazeLevel(
    rooms: [
      MazeRoom(
        id: 1,
        doors: [
          MazeDoor(color: Color(0xFF37C978), targetRoomId: 12),
          MazeDoor(color: Color(0xFFF3BF45), targetRoomId: 2),
        ],
      ),
      MazeRoom(
        id: 2,
        doors: [
          MazeDoor(color: Color(0xFFF3BF45), targetRoomId: 1),
          MazeDoor(color: Color(0xFFFF8A3D), targetRoomId: 3),
        ],
      ),
      MazeRoom(
        id: 3,
        doors: [
          MazeDoor(color: Color(0xFF00B8A9), targetRoomId: 1),
          MazeDoor(color: Color(0xFFEF476F), targetRoomId: 4),
        ],
      ),
      MazeRoom(
        id: 4,
        doors: [
          MazeDoor(color: Color(0xFF06D6A0), targetRoomId: 12),
          MazeDoor(color: Color(0xFF118AB2), targetRoomId: 5),
          MazeDoor(color: Color(0xFFFFD166), targetRoomId: 2),
        ],
      ),
      MazeRoom(
        id: 5,
        doors: [
          MazeDoor(color: Color(0xFFFFD166), targetRoomId: 6),
          MazeDoor(color: Color(0xFF8338EC), targetRoomId: 12),
          MazeDoor(color: Color(0xFFFB5607), targetRoomId: 3),
        ],
      ),
      MazeRoom(
        id: 6,
        doors: [
          MazeDoor(color: Color(0xFFFB5607), targetRoomId: 12),
          MazeDoor(color: Color(0xFF4CC9F0), targetRoomId: 7),
          MazeDoor(color: Color(0xFFB5179E), targetRoomId: 4),
        ],
      ),
      MazeRoom(
        id: 7,
        doors: [
          MazeDoor(color: Color(0xFFB5179E), targetRoomId: 5),
          MazeDoor(color: Color(0xFFE94F5E), targetRoomId: 12),
          MazeDoor(color: Color(0xFF3C7BFF), targetRoomId: 8),
        ],
      ),
      MazeRoom(
        id: 8,
        doors: [
          MazeDoor(color: Color(0xFF3C7BFF), targetRoomId: 9),
          MazeDoor(color: Color(0xFF37C978), targetRoomId: 6),
          MazeDoor(color: Color(0xFF9B5CFF), targetRoomId: 12),
        ],
      ),
      MazeRoom(
        id: 9,
        doors: [
          MazeDoor(color: Color(0xFF9B5CFF), targetRoomId: 12),
          MazeDoor(color: Color(0xFFFF8A3D), targetRoomId: 12),
          MazeDoor(color: Color(0xFFFFFFFF), targetRoomId: 10),
          MazeDoor(color: Color(0xFF00B8A9), targetRoomId: 12),
        ],
      ),
      MazeRoom(
        id: 10,
        doors: [
          MazeDoor(color: Color(0xFFFF8A3D), targetRoomId: 11),
          MazeDoor(color: Color(0xFFFFFFFF), targetRoomId: 12),
        ],
      ),
      MazeRoom(
        id: 11,
        doors: [MazeDoor(color: Color(0xFFEF476F), targetRoomId: 0)],
      ),
      MazeRoom(
        id: 12,
        doors: [MazeDoor(color: Colors.purple, targetRoomId: 13)],
      ),
      MazeRoom(
        id: 13,
        doors: [MazeDoor(color: Color(0xFFEF476F), targetRoomId: 1)],
      ),
      MazeRoom(id: 0, doors: []),
    ],
    isPremium: true,
  ),
];
