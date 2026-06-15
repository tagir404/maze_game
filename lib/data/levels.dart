import 'package:flutter/material.dart';
import 'package:maze_game/models/maze_door.dart';
import 'package:maze_game/models/maze_level.dart';
import 'package:maze_game/models/maze_room.dart';

const List<MazeLevel> levels = [
  MazeLevel(
    title: 'Уровень 1',
    startRoomId: 1,
    rooms: [
      MazeRoom(
        id: 1,
        doors: [
          MazeDoor(
            id: 101,
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 2,
          ),
          MazeDoor(
            id: 102,
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 1,
          ),
        ],
      ),
      MazeRoom(
        id: 2,
        doors: [
          MazeDoor(
            id: 201,
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 3,
          ),
          MazeDoor(
            id: 202,
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 1,
          ),
        ],
      ),
      MazeRoom(
        id: 3,
        doors: [
          MazeDoor(
            id: 301,
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 0,
          ),
        ],
      ),
      MazeRoom(id: 0, doors: []),
    ],
  ),
  MazeLevel(
    title: 'Уровень 2',
    startRoomId: 1,
    rooms: [
      MazeRoom(
        id: 1,
        doors: [
          MazeDoor(
            id: 101,
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 2,
          ),
          MazeDoor(
            id: 102,
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 4,
          ),
          MazeDoor(
            id: 103,
            label: 'Оранжевая',
            color: Color(0xFFFF8A3D),
            targetRoomId: 1,
          ),
        ],
      ),
      MazeRoom(
        id: 2,
        doors: [
          MazeDoor(
            id: 201,
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 3,
          ),
          MazeDoor(
            id: 202,
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 1,
          ),
        ],
      ),
      MazeRoom(
        id: 3,
        doors: [
          MazeDoor(
            id: 301,
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 0,
          ),
          MazeDoor(
            id: 302,
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 4,
          ),
        ],
      ),
      MazeRoom(
        id: 4,
        doors: [
          MazeDoor(
            id: 401,
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 2,
          ),
          MazeDoor(
            id: 402,
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 1,
          ),
        ],
      ),
      MazeRoom(id: 0, doors: []),
      MazeRoom(
        id: 5,
        doors: [
          MazeDoor(
            id: 501,
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 3,
          ),
        ],
      ),
    ],
  ),
  MazeLevel(
    title: 'Уровень 3',
    startRoomId: 1,
    rooms: [
      MazeRoom(
        id: 1,
        doors: [
          MazeDoor(
            id: 101,
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 2,
          ),
          MazeDoor(
            id: 102,
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 4,
          ),
        ],
      ),
      MazeRoom(
        id: 2,
        doors: [
          MazeDoor(
            id: 201,
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 3,
          ),
          MazeDoor(
            id: 202,
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 1,
          ),
          MazeDoor(
            id: 203,
            label: 'Оранжевая',
            color: Color(0xFFFF8A3D),
            targetRoomId: 5,
          ),
        ],
      ),
      MazeRoom(
        id: 3,
        doors: [
          MazeDoor(
            id: 301,
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 4,
          ),
          MazeDoor(
            id: 302,
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 6,
          ),
        ],
      ),
      MazeRoom(
        id: 4,
        doors: [
          MazeDoor(
            id: 401,
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 0,
          ),
          MazeDoor(
            id: 402,
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 2,
          ),
        ],
      ),
      MazeRoom(
        id: 5,
        doors: [
          MazeDoor(
            id: 501,
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 3,
          ),
        ],
      ),
      MazeRoom(
        id: 6,
        doors: [
          MazeDoor(
            id: 601,
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 1,
          ),
          MazeDoor(
            id: 602,
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 5,
          ),
        ],
      ),
      MazeRoom(id: 0, doors: []),
      MazeRoom(
        id: 7,
        doors: [
          MazeDoor(
            id: 701,
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 1,
          ),
        ],
      ),
    ],
  ),
];
