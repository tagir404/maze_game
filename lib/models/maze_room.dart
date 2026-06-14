import 'package:maze_game/models/maze_door.dart';

class MazeRoom {
  const MazeRoom({required this.id, required this.doors});

  final int id;
  final List<MazeDoor> doors;
}
