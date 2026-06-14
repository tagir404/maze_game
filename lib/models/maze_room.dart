import 'package:maze_game/models/maze_door.dart';

class MazeRoom {
  const MazeRoom({required this.id, required this.name, required this.doors});

  final int id;
  final String name;
  final List<MazeDoor> doors;
}
