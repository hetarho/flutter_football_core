import 'package:hive_ce_flutter/hive_flutter.dart';

class FixtureModel extends HiveObject {
  static const String boxName = 'fixture';
  static const String lastIdBoxName = 'fixture_last_id';

  late final int id;
  late final int leagueId;
  late final int gameSlotId;
  late final int seasonId;
  late final int homeClubId;
  late final int awayClubId;
  late final DateTime date;
  late final int homeScore;
  late final int awayScore;
  late final Duration homePossessionTime;
  late final Duration awayPossessionTime;

  FixtureModel({
    required this.id,
    required this.leagueId,
    required this.gameSlotId,
    required this.seasonId,
    required this.homeClubId,
    required this.awayClubId,
    required this.date,
    required this.homeScore,
    required this.awayScore,
    required this.homePossessionTime,
    required this.awayPossessionTime,
  });
}
