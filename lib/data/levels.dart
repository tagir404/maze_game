import 'package:flutter/material.dart';
import 'package:maze_game/models/maze_door.dart';
import 'package:maze_game/models/maze_level.dart';
import 'package:maze_game/models/maze_room.dart';

const List<MazeLevel> levels = [
  MazeLevel(
    title: 'Уровень 1: Три двери',
    startRoomId: 1,
    requiredDoorIds: {101, 201},
    rooms: [
      MazeRoom(
        id: 1,
        name: 'Синий зал',
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
        name: 'Кладовая',
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
        name: 'Комната выхода',
        doors: [
          MazeDoor(
            id: 301,
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 1,
          ),
        ],
      ),
    ],
  ),
  MazeLevel(
    title: 'Уровень 2: Цветная петля',
    startRoomId: 1,
    requiredDoorIds: {101, 201, 301},
    rooms: [
      MazeRoom(
        id: 1,
        name: 'Площадь',
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
        name: 'Сад',
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
        name: 'Башня',
        doors: [
          MazeDoor(
            id: 301,
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 5,
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
        name: 'Подвал',
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
      MazeRoom(
        id: 5,
        name: 'Тихий выход',
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
    title: 'Уровень 3: Большой лабиринт',
    startRoomId: 1,
    requiredDoorIds: {101, 201, 301, 401},
    rooms: [
      MazeRoom(
        id: 1,
        name: 'Атриум',
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
        name: 'Библиотека',
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
        name: 'Мост',
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
        name: 'Кузница',
        doors: [
          MazeDoor(
            id: 401,
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 7,
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
        name: 'Обсерватория',
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
        name: 'Хранилище',
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
      MazeRoom(
        id: 7,
        name: 'Святилище',
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
