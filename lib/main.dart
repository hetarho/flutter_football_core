import 'package:flutter/material.dart';
import 'package:flutter_football_core/data/local-storage/hive/hive_open_boxes.dart';
import 'package:flutter_football_core/data/local-storage/hive/hive_registrar.g.dart';
import 'package:flutter_football_core/di.dart';
import 'package:flutter_football_core/route.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Hive.initFlutter();

  // // 모든 Hive 데이터 삭제
  await Hive.deleteFromDisk();

  // 모델 어댑터 등록
  Hive.registerAdapters();

  // 필요한 Hive 박스 열기
  await Hive.openBoxes();

  // 의존성 주입 설정
  setupLocator();
  await GetIt.I.allReady();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
