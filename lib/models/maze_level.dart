import 'package:maze_game/models/maze_room.dart';

class MazeLevel {
  const MazeLevel({required this.rooms, this.isPremium = false});

  final List<MazeRoom> rooms;
  final bool isPremium;

  MazeRoom roomById(int id) => rooms.firstWhere((room) => room.id == id);
}
