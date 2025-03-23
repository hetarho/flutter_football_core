import 'package:flutter/material.dart';
import 'package:flutter_football_core/data/local-storage/hive/hive_registrar.g.dart';
import 'package:flutter_football_core/data/model/club.model.dart';
import 'package:flutter_football_core/data/model/game_slot.model.dart';
import 'package:flutter_football_core/data/model/league.model.dart';
import 'package:flutter_football_core/data/model/player.model.dart';
import 'package:flutter_football_core/data/model/season.model.dart';
import 'package:flutter_football_core/di.dart';
import 'package:flutter_football_core/route.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  // 의존성 주입 설정
  setupLocator();
  await GetIt.I.allReady();

  // 모델 어댑터 등록
  Hive.registerAdapters();

  // 필요한 Hive 박스 열기
  await Hive.openBox(GameSlotModel.boxName);
  await Hive.openBox<int>(GameSlotModel.lastIdBoxName);
  await Hive.openBox(ClubModel.boxName);
  await Hive.openBox<int>(ClubModel.lastIdBoxName);
  await Hive.openBox(PlayerModel.boxName);
  await Hive.openBox<int>(PlayerModel.lastIdBoxName);
  await Hive.openBox(LeagueModel.boxName);
  await Hive.openBox<int>(LeagueModel.lastIdBoxName);
  await Hive.openBox(SeasonModel.boxName);
  await Hive.openBox<int>(SeasonModel.lastIdBoxName);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
