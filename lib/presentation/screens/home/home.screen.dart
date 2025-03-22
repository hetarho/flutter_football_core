import 'package:flutter/material.dart';
import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/presentation/components/button.dart';
import 'package:flutter_football_core/presentation/components/delete_button.dart';
import 'package:flutter_football_core/presentation/components/foldable_button.dart';
import 'package:flutter_football_core/presentation/screens/create_game_slot/create_game_slot.screen.dart';
import 'package:flutter_football_core/use-cases/club/get_all_club_by_game_slot_id.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/create_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/delete_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/get_all_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/get_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/update_game_slot.uc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GetAllGameSlotUsecase getAllGameSlotUsecase = GetIt.I.get<GetAllGameSlotUsecase>();
  late CreateGameSlotUsecase createGameSlotUsecase = GetIt.I.get<CreateGameSlotUsecase>();
  late GetGameSlotUsecase getGameSlotUsecase = GetIt.I.get<GetGameSlotUsecase>();
  late DeleteGameSlotUsecase deleteGameSlotUsecase = GetIt.I.get<DeleteGameSlotUsecase>();
  late UpdateGameSlotUsecase updateGameSlotUsecase = GetIt.I.get<UpdateGameSlotUsecase>();
  late GetAllClubByGameSlotIdUsecase getAllClubByGameSlotIdUsecase = GetIt.I.get<GetAllClubByGameSlotIdUsecase>();
  List<GameSlot> gameSlots = [];
  Map<int, bool> isFolded = {};
  List<Club> clubs = [];
  int selectedGameSlotId = 0;
  @override
  void initState() {
    super.initState();

    _getAllGameSlot();
  }

  Future<void> _getAllGameSlot() async {
    final gameSlots = await getAllGameSlotUsecase.execute();
    setState(() {
      this.gameSlots = gameSlots;
      for (var gameSlot in gameSlots) {
        isFolded[gameSlot.id] = false;
      }
    });
  }

  Future<void> _deleteGameSlot(int id) async {
    await deleteGameSlotUsecase.execute(DeleteGameSlotParams(id: id));
    _getAllGameSlot();
  }

  Future<void> _foldGameSlot(int id) async {
    setState(() {
      isFolded[id] = !(isFolded[id] ?? false);
      selectedGameSlotId = id;
    });

    final clubs = await getAllClubByGameSlotIdUsecase.execute(GetAllClubByGameSlotIdParams(gameSlotId: id));
    setState(() {
      this.clubs = clubs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Button(
                onPressed: () {
                  context.push(CreateGameSlotScreen.routeName);
                },
                child: const Text('Create Game Slot'),
              ),
              const Gap(16),
              ...gameSlots.map((gameSlot) => Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${gameSlot.id} ${gameSlot.saveName}'),
                          const Gap(16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('create: ${gameSlot.createAt.toString().substring(0, 19)}'),
                              Text('last play: ${gameSlot.updateAt.toString().substring(0, 19)}'),
                            ],
                          ),
                          const Gap(16),
                          DeleteButton(onPressed: () => _deleteGameSlot(gameSlot.id)),
                          const Gap(16),
                          FoldableButton(onPressed: () => _foldGameSlot(gameSlot.id), isFolded: isFolded[gameSlot.id] ?? false),
                        ],
                      ),
                      const Gap(16),
                      if ((isFolded[gameSlot.id] ?? false) && selectedGameSlotId == gameSlot.id) ...[
                        Column(
                          children: clubs
                              .map((club) => Column(
                                    children: [
                                      Text('${club.name} ${club.stat}'),
                                      Text(club.players.map((player) => player.name).join(', ')),
                                      const SizedBox(height: 8),
                                    ],
                                  ))
                              .toList(),
                        ),
                      ]
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
