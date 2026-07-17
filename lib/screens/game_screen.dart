import 'package:flutter/material.dart';
import 'package:maze_game/common/constants.dart';
import 'package:maze_game/core/app_dependencies.dart';
import 'package:maze_game/dialogs/hint_dialog.dart';
import 'package:maze_game/logic/maze_path_finder.dart';
import 'package:maze_game/models/maze_door.dart';
import 'package:maze_game/models/maze_level.dart';
import 'package:maze_game/models/maze_room.dart';
import 'package:maze_game/services/audio_service.dart';
import 'package:maze_game/services/wallet_service.dart';
import 'package:maze_game/widgets/coins_display.dart';
import 'package:maze_game/widgets/room_background.dart';
import 'package:maze_game/widgets/control_button.dart';
import 'package:maze_game/widgets/door.dart';
import 'package:maze_game/widgets/player.dart';
import 'package:maze_game/dialogs/win_dialog.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({required this.level, required this.levelNumber, super.key});

  final MazeLevel level;
  final int levelNumber;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  MazeDoor? hintDoor;
  int roomId = 1;
  int selectedDoorIndex = 0;

  MazeRoom get room => widget.level.roomById(roomId);

  @override
  void initState() {
    super.initState();
  }

  void move(int direction) {
    final nextIndex = (selectedDoorIndex + direction)
        .clamp(0, room.doors.length - 1)
        .toInt();
    if (nextIndex == selectedDoorIndex) {
      return;
    }

    setState(() {
      selectedDoorIndex = nextIndex;
    });
  }

  void useAction() async {
    final door = selectedDoor;
    if (door == null) return;

    audioService.playDoorOpen();

    setState(() {
      roomId = door.targetRoomId;
      selectedDoorIndex = 0;
      hintDoor = null;
    });

    if (room.isExit) _handleWin();
  }

  MazeDoor? get selectedDoor {
    if (room.doors.isEmpty) return null;

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

  Future<void> _handleWin() async {
    final progressService = AppDependencies.of(context).progressService;

    await progressService.unlockNextLevel(widget.levelNumber);

    await Future.delayed(const Duration(milliseconds: 250));

    if (!mounted) return;

    showWinDialog(
      context,
      levelNumber: widget.levelNumber,
      roomsCount: widget.level.rooms.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Уровень ${widget.levelNumber}'),
        actions: [
          IconButton(
            onPressed: () async {
              final result = await showHintDialog(context);

              if (result == true) {
                setState(() {
                  hintDoor = MazePathFinder.findHintDoor(
                    level: widget.level,
                    currentRoomId: roomId,
                  );
                });
              }
            },
            icon: const Icon(Icons.lightbulb),
          ),
          AnimatedBuilder(
            animation: walletService,
            builder: (context, _) => Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: CoinsDisplay(quantity: walletService.coins),
              ),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 20),
      ),
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
                        const Positioned.fill(child: RoomBackground()),
                        for (var index = 0; index < room.doors.length; index++)
                          Door(
                            door: room.doors[index],
                            isHint: room.doors[index] == hintDoor,
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
