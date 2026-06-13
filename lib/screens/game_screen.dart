import 'package:flutter/material.dart';
import 'package:maze_game/common/constants.dart';
import 'package:maze_game/models/maze_door.dart';
import 'package:maze_game/models/maze_level.dart';
import 'package:maze_game/models/maze_room.dart';
import 'package:maze_game/services/sound_effects.dart';
import 'package:maze_game/widgets/room_background.dart';
import 'package:maze_game/widgets/control_button.dart';
import 'package:maze_game/widgets/door.dart';
import 'package:maze_game/widgets/player.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({required this.level, super.key});

  final MazeLevel level;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late String roomId;
  final Set<String> openedRequiredDoors = <String>{};
  int selectedDoorIndex = 0;

  MazeRoom get room => widget.level.roomById(roomId);

  @override
  void initState() {
    super.initState();
    roomId = widget.level.startRoomId;
  }

  void move(int direction) {
    final nextIndex = (selectedDoorIndex + direction)
        .clamp(0, room.doors.length - 1)
        .toInt();
    if (nextIndex == selectedDoorIndex) {
      return;
    }

    SoundEffects.playDoorSwitch();
    setState(() {
      selectedDoorIndex = nextIndex;
    });
  }

  void useAction() {
    final door = selectedDoor;
    if (door == null) {
      return;
    }

    final isRequired = widget.level.requiredDoorIds.contains(door.id);
    SoundEffects.playRoomEntry();
    setState(() {
      if (isRequired) {
        openedRequiredDoors.add(door.id);
      }
      roomId = door.targetRoomId;
      selectedDoorIndex = 0;
    });

    if (openedRequiredDoors.length == widget.level.requiredDoorIds.length) {
      Future<void>.delayed(const Duration(milliseconds: 250), _showWinDialog);
    }
  }

  MazeDoor? get selectedDoor {
    if (room.doors.isEmpty) {
      return null;
    }
    final safeIndex = selectedDoorIndex.clamp(0, room.doors.length - 1).toInt();
    return room.doors[safeIndex];
  }

  double get playerX {
    if (room.doors.isEmpty) {
      return 0.5;
    }
    final safeIndex = selectedDoorIndex.clamp(0, room.doors.length - 1).toInt();
    return _doorPosition(safeIndex, room.doors.length);
  }

  double _doorPosition(int index, int count) => (index + 1) / (count + 1);

  void _showWinDialog() {
    if (!mounted) {
      return;
    }
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Уровень пройден!'),
        content: Text(
          'Ты нашёл все нужные двери в уровне «${widget.level.title}». Комнат: ${widget.level.rooms.length}.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Остаться'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            child: const Text('В меню'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.level.title), actions: []),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: RoomBackground(roomName: room.name),
                        ),
                        for (var index = 0; index < room.doors.length; index++)
                          Door(
                            door: room.doors[index],
                            left:
                                constraints.maxWidth *
                                    _doorPosition(index, room.doors.length) -
                                Constants.doorWidth / 2,
                          ),
                        Positioned(
                          left:
                              constraints.maxWidth * playerX -
                              Constants.playerSize / 2,
                          bottom: 0,
                          child: const Player(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
              child: Row(
                children: [
                  ControlButton(
                    icon: Icons.keyboard_arrow_left_rounded,
                    onPressed: () => move(-1),
                  ),
                  const SizedBox(width: 14),
                  ControlButton(
                    icon: Icons.keyboard_arrow_right_rounded,
                    onPressed: () => move(1),
                  ),
                  const Spacer(),
                  ControlButton(icon: Icons.login, onPressed: useAction),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
