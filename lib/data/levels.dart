import 'package:flutter/material.dart';
import 'package:maze_game/models/maze_door.dart';
import 'package:maze_game/models/maze_level.dart';
import 'package:maze_game/models/maze_room.dart';

const List<MazeLevel> levels = [
  MazeLevel(
    title: 'Уровень 1: Три двери',
    description: 'Обучающий лабиринт из 3 комнат.',
    startRoomId: 'hall',
    requiredDoorIds: {'hall_red', 'storage_green'},
    rooms: [
      MazeRoom(
        id: 'hall',
        name: 'Синий зал',
        doors: [
          MazeDoor(
            id: 'hall_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'storage',
          ),
          MazeDoor(
            id: 'hall_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'hall',
          ),
        ],
      ),
      MazeRoom(
        id: 'storage',
        name: 'Кладовая',
        doors: [
          MazeDoor(
            id: 'storage_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'exit',
          ),
          MazeDoor(
            id: 'storage_purple',
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 'hall',
          ),
        ],
      ),
      MazeRoom(
        id: 'exit',
        name: 'Комната выхода',
        doors: [
          MazeDoor(
            id: 'exit_yellow',
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 'hall',
          ),
        ],
      ),
    ],
  ),
  MazeLevel(
    title: 'Уровень 2: Цветная петля',
    description: '5 комнат и несколько обманных переходов.',
    startRoomId: 'square',
    requiredDoorIds: {'square_green', 'garden_red', 'tower_yellow'},
    rooms: [
      MazeRoom(
        id: 'square',
        name: 'Площадь',
        doors: [
          MazeDoor(
            id: 'square_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'garden',
          ),
          MazeDoor(
            id: 'square_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'cellar',
          ),
          MazeDoor(
            id: 'square_orange',
            label: 'Оранжевая',
            color: Color(0xFFFF8A3D),
            targetRoomId: 'square',
          ),
        ],
      ),
      MazeRoom(
        id: 'garden',
        name: 'Сад',
        doors: [
          MazeDoor(
            id: 'garden_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'tower',
          ),
          MazeDoor(
            id: 'garden_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'square',
          ),
        ],
      ),
      MazeRoom(
        id: 'tower',
        name: 'Башня',
        doors: [
          MazeDoor(
            id: 'tower_yellow',
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 'exit2',
          ),
          MazeDoor(
            id: 'tower_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'cellar',
          ),
        ],
      ),
      MazeRoom(
        id: 'cellar',
        name: 'Подвал',
        doors: [
          MazeDoor(
            id: 'cellar_purple',
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 'garden',
          ),
          MazeDoor(
            id: 'cellar_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'square',
          ),
        ],
      ),
      MazeRoom(
        id: 'exit2',
        name: 'Тихий выход',
        doors: [
          MazeDoor(
            id: 'exit2_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'tower',
          ),
        ],
      ),
    ],
  ),
  MazeLevel(
    title: 'Уровень 3: Большой лабиринт',
    description: '7 комнат — больше комнат, выше сложность.',
    startRoomId: 'atrium',
    requiredDoorIds: {
      'atrium_red',
      'library_violet',
      'bridge_green',
      'forge_blue',
    },
    rooms: [
      MazeRoom(
        id: 'atrium',
        name: 'Атриум',
        doors: [
          MazeDoor(
            id: 'atrium_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'library',
          ),
          MazeDoor(
            id: 'atrium_yellow',
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 'forge',
          ),
        ],
      ),
      MazeRoom(
        id: 'library',
        name: 'Библиотека',
        doors: [
          MazeDoor(
            id: 'library_violet',
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 'bridge',
          ),
          MazeDoor(
            id: 'library_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'atrium',
          ),
          MazeDoor(
            id: 'library_orange',
            label: 'Оранжевая',
            color: Color(0xFFFF8A3D),
            targetRoomId: 'observatory',
          ),
        ],
      ),
      MazeRoom(
        id: 'bridge',
        name: 'Мост',
        doors: [
          MazeDoor(
            id: 'bridge_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'forge',
          ),
          MazeDoor(
            id: 'bridge_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'vault',
          ),
        ],
      ),
      MazeRoom(
        id: 'forge',
        name: 'Кузница',
        doors: [
          MazeDoor(
            id: 'forge_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'sanctuary',
          ),
          MazeDoor(
            id: 'forge_yellow',
            label: 'Жёлтая',
            color: Color(0xFFF3BF45),
            targetRoomId: 'library',
          ),
        ],
      ),
      MazeRoom(
        id: 'observatory',
        name: 'Обсерватория',
        doors: [
          MazeDoor(
            id: 'observatory_blue',
            label: 'Синяя',
            color: Color(0xFF3C7BFF),
            targetRoomId: 'bridge',
          ),
        ],
      ),
      MazeRoom(
        id: 'vault',
        name: 'Хранилище',
        doors: [
          MazeDoor(
            id: 'vault_violet',
            label: 'Фиолетовая',
            color: Color(0xFF9B5CFF),
            targetRoomId: 'atrium',
          ),
          MazeDoor(
            id: 'vault_green',
            label: 'Зелёная',
            color: Color(0xFF37C978),
            targetRoomId: 'observatory',
          ),
        ],
      ),
      MazeRoom(
        id: 'sanctuary',
        name: 'Святилище',
        doors: [
          MazeDoor(
            id: 'sanctuary_red',
            label: 'Красная',
            color: Color(0xFFE94F5E),
            targetRoomId: 'atrium',
          ),
        ],
      ),
    ],
  ),
];
