import 'package:flutter/material.dart';
import 'package:flutter_football_core/data/model/club.model.dart';
import 'package:flutter_football_core/data/model/game_slot.model.dart';
import 'package:flutter_football_core/data/model/league.model.dart';
import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/entities/league/league.dart';
import 'package:flutter_football_core/entities/season/season.dart';
import 'package:flutter_football_core/presentation/components/button.dart';
import 'package:flutter_football_core/presentation/components/delete_button.dart';
import 'package:flutter_football_core/presentation/components/foldable_button.dart';
import 'package:flutter_football_core/presentation/components/select_button.dart';
import 'package:flutter_football_core/presentation/providers/game_slot.provider.dart';
import 'package:flutter_football_core/presentation/screens/create_game_slot/create_game_slot.screen.dart';
import 'package:flutter_football_core/presentation/screens/create_game_slot/select_club.screen.dart';
import 'package:flutter_football_core/presentation/screens/dashboard/dashboard.screen.dart';
import 'package:flutter_football_core/use-cases/club/get_all_club_by_game_slot_id.uc.dart';
import 'package:flutter_football_core/use-cases/club/get_club_by_league_id.dart';
import 'package:flutter_football_core/use-cases/game_slot/create_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/delete_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/get_all_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/get_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/update_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/league/get_all_league_by_game_slot_id.dart';
import 'package:flutter_football_core/use-cases/season/get_all_season_by_leagud_id.uc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late GetAllGameSlotUsecase getAllGameSlotUsecase = GetIt.I.get<GetAllGameSlotUsecase>();
  late CreateGameSlotUsecase createGameSlotUsecase = GetIt.I.get<CreateGameSlotUsecase>();
  late GetGameSlotUsecase getGameSlotUsecase = GetIt.I.get<GetGameSlotUsecase>();
  late DeleteGameSlotUsecase deleteGameSlotUsecase = GetIt.I.get<DeleteGameSlotUsecase>();
  late UpdateGameSlotUsecase updateGameSlotUsecase = GetIt.I.get<UpdateGameSlotUsecase>();
  late GetAllClubByGameSlotIdUsecase getAllClubByGameSlotIdUsecase = GetIt.I.get<GetAllClubByGameSlotIdUsecase>();
  late GetAllLeagueByGameSlotIdUsecase getAllLeagueByGameSlotIdUsecase = GetIt.I.get<GetAllLeagueByGameSlotIdUsecase>();
  List<GameSlot> gameSlots = [];
  Map<int, bool> isFolded = {};
  List<Club> clubs = [];
  List<League> leagues = [];
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

  Future<void> _selectGameSlot(int id) async {
    final gameSlot = await getGameSlotUsecase.execute(GetGameSlotParams(id: id));
    ref.read(selectedGameSlotProvider.notifier).state = gameSlot;
    if (mounted) {
      if (gameSlot.selectedClubId == null) {
        context.push(SelectClubScreen.routeName);
      } else {
        context.go(DashboardScreen.routeName);
      }
    }
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
              // Button(
              //   onPressed: () {
              //     final lbox = Hive.box(LeagueModel.boxName);
              //     final cbox = Hive.box(ClubModel.boxName);
              //     final gbox = Hive.box(GameSlotModel.boxName);

              //     print(lbox.values.length);
              //     print(cbox.values.length);
              //     print(gbox.values.length);
              //   },
              //   child: const Text('rwar'),
              // ),
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
                              Text('생성일: ${gameSlot.createAt.toString().substring(2, 19).replaceAll('-', '/')}'),
                              Text('저장일: ${gameSlot.updateAt.toString().substring(2, 19).replaceAll('-', '/')}'),
                            ],
                          ),
                          const Gap(16),
                          SelectButton(onPressed: () => _selectGameSlot(gameSlot.id)),
                          const Gap(16),
                          DeleteButton(onPressed: () => _deleteGameSlot(gameSlot.id)),
                          const Gap(16),
                        ],
                      ),
                      const Gap(16),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
