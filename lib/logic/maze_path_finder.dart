import 'package:maze_game/models/maze_door.dart';
import 'package:maze_game/models/maze_level.dart';

class MazePathFinder {
  static List<int>? findPathToExit({
    required MazeLevel level,
    required int startRoomId,
  }) {
    final queue = <List<int>>[
      [startRoomId],
    ];

    final visited = <int>{startRoomId};

    while (queue.isNotEmpty) {
      final path = queue.removeAt(0);
      final currentRoomId = path.last;

      final currentRoom = level.roomById(currentRoomId);

      if (currentRoom.isExit) {
        return path;
      }

      for (final door in currentRoom.doors) {
        final next = door.targetRoomId;

        if (visited.contains(next)) continue;
        visited.add(next);

        queue.add([...path, next]);
      }
    }

    return null;
  }

  static MazeDoor? findHintDoor({
    required MazeLevel level,
    required int currentRoomId,
  }) {
    final path = findPathToExit(level: level, startRoomId: currentRoomId);

    if (path == null || path.length < 2) return null;

    final nextRoomId = path[1];
    final room = level.roomById(currentRoomId);

    for (final door in room.doors) {
      if (door.targetRoomId == nextRoomId) {
        return door;
      }
    }

    return null;
  }
}
