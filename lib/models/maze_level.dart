import 'package:maze_game/models/maze_room.dart';

class MazeLevel {
  const MazeLevel({
    required this.title,
    required this.rooms,
    required this.startRoomId,
  });

  final String title;
  final List<MazeRoom> rooms;
  final int startRoomId;

  MazeRoom roomById(int id) => rooms.firstWhere((room) => room.id == id);
}
