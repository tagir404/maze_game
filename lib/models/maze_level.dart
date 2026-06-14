import 'package:maze_game/models/maze_room.dart';

class MazeLevel {
  const MazeLevel({
    required this.title,
    required this.rooms,
    required this.startRoomId,
    required this.requiredDoorIds,
  });

  final String title;
  final List<MazeRoom> rooms;
  final int startRoomId;
  final Set<int> requiredDoorIds;

  MazeRoom roomById(int id) => rooms.firstWhere((room) => room.id == id);
}
