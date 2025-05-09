// Generated by Hive CE
// Do not modify
// Check in to version control

import 'package:hive_ce/hive.dart';
import 'package:flutter_football_core/data/local-storage/hive/hive_adapters.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(ClubModelAdapter());
    registerAdapter(FixtureModelAdapter());
    registerAdapter(GameSlotModelAdapter());
    registerAdapter(LeagueModelAdapter());
    registerAdapter(PlayerModelAdapter());
    registerAdapter(SeasonModelAdapter());
    registerAdapter(HiveCountryAdapter());
    registerAdapter(HivePositionAdapter());
  }
}
