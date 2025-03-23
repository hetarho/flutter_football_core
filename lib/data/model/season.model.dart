import 'package:hive_ce_flutter/hive_flutter.dart';

class SeasonModel extends HiveObject {
  static const String boxName = 'season';
  static const String lastIdBoxName = 'season_last_id';

  final int id;
  final int leagueId;
  final int gameSlotId;
  final DateTime startDate;
  final DateTime endDate;

  SeasonModel({required this.id, required this.leagueId, required this.gameSlotId, required this.startDate, required this.endDate});
}
