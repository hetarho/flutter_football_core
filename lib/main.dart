import 'package:flutter/material.dart';
import 'package:flutter_football_core/data/data-sources/local_data_source.dart';
import 'package:flutter_football_core/data/local-storage/hive/hive_adapters.dart';
import 'package:flutter_football_core/data/local-storage/hive/hive_local_storage.dart';
import 'package:flutter_football_core/data/repositories/game_slot.repository.dart';
import 'package:flutter_football_core/di.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/create_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/delete_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/get_all_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/get_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:flutter_football_core/use-cases/update_game_slot.uc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  // 의존성 주입 설정
  setupLocator();
  await GetIt.I.allReady();

  // 모델 어댑터 등록
  Hive.registerAdapter(GameSlotModelAdapter());

  // 필요한 Hive 박스 열기
  await Hive.openBox('game_slot');
  await Hive.openBox<int>('game_slot_last_id');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GetAllGameSlotUsecase getAllGameSlotUsecase = GetIt.I.get<GetAllGameSlotUsecase>();
  late CreateGameSlotUsecase createGameSlotUsecase = GetIt.I.get<CreateGameSlotUsecase>();
  late GetGameSlotUsecase getGameSlotUsecase = GetIt.I.get<GetGameSlotUsecase>();
  late DeleteGameSlotUsecase deleteGameSlotUsecase = GetIt.I.get<DeleteGameSlotUsecase>();
  late UpdateGameSlotUsecase updateGameSlotUsecase = GetIt.I.get<UpdateGameSlotUsecase>();
  List<GameSlot> gameSlots = [];

  @override
  void initState() {
    super.initState();

    _getAllGameSlot();
  }

  Future<void> _createGameSlot() async {
    await createGameSlotUsecase.execute(CreateGameSlotParams(saveName: 'test0'));
    _getAllGameSlot();
  }

  Future<void> _getAllGameSlot() async {
    final gameSlots = await getAllGameSlotUsecase.execute();
    setState(() {
      this.gameSlots = gameSlots;
    });
  }

  Future<void> _deleteGameSlot(int id) async {
    await deleteGameSlotUsecase.execute(DeleteGameSlotParams(id: id));
    _getAllGameSlot();
  }

  Future<void> _updateGameSlot(int id) async {
    final gameSlot = await getGameSlotUsecase.execute(GetGameSlotParams(id: id));

    int updateNum = int.parse(gameSlot.saveName.substring(4)) + 1;

    await updateGameSlotUsecase.execute(UpdateGameSlotParams(id: id, saveName: 'test$updateNum'));
    _getAllGameSlot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _createGameSlot();
              },
              child: const Text('Create Game Slot'),
            ),
            ...gameSlots.map((gameSlot) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${gameSlot.id} ${gameSlot.saveName}'),
                    const Gap(16),
                    Text('${gameSlot.createAt.toString().substring(0, 19)} / ${gameSlot.updateAt.toString().substring(0, 19)}'),
                    const Gap(16),
                    Text(gameSlot.saveName),
                    const Gap(16),
                    ElevatedButton(onPressed: () => _deleteGameSlot(gameSlot.id), child: const Text('Delete')),
                    const Gap(16),
                    ElevatedButton(onPressed: () => _updateGameSlot(gameSlot.id), child: const Text('Update')),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
