import 'package:flutter_football_core/data/model/club.model.dart';
import 'package:flutter_football_core/data/model/game_slot.model.dart';
import 'package:flutter_football_core/data/model/league.model.dart';
import 'package:flutter_football_core/data/model/player.model.dart';
import 'package:flutter_football_core/data/model/season.model.dart';
import 'package:hive_ce/hive.dart';

extension HiveOpenBoxes on HiveInterface {
  Future<void> openBoxes() async {
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
  }
}
