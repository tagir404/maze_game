import 'package:maze_game/models/maze_door.dart';

class MazeRoom {
  const MazeRoom({required this.id, required this.doors});

  static const int exitRoomId = 0;

  final int id;
  final List<MazeDoor> doors;

  bool get isExit => id == exitRoomId;
}
