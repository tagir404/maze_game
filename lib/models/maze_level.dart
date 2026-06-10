import 'package:maze_game/models/maze_room.dart';

class MazeLevel {
  const MazeLevel({
    required this.title,
    required this.description,
    required this.rooms,
    required this.startRoomId,
    required this.requiredDoorIds,
  });

  final String title;
  final String description;
  final List<MazeRoom> rooms;
  final String startRoomId;
  final Set<String> requiredDoorIds;

  MazeRoom roomById(String id) => rooms.firstWhere((room) => room.id == id);
}
