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

  FixtureModel copyWith({
    int? id,
    int? leagueId,
    int? gameSlotId,
    int? seasonId,
    int? homeClubId,
    int? awayClubId,
    DateTime? date,
    int? homeScore,
    int? awayScore,
    Duration? homePossessionTime,
    Duration? awayPossessionTime,
  }) {
    return FixtureModel(
      id: id ?? this.id,
      leagueId: leagueId ?? this.leagueId,
      gameSlotId: gameSlotId ?? this.gameSlotId,
      seasonId: seasonId ?? this.seasonId,
      homeClubId: homeClubId ?? this.homeClubId,
      awayClubId: awayClubId ?? this.awayClubId,
      date: date ?? this.date,
      homeScore: homeScore ?? this.homeScore,
      awayScore: awayScore ?? this.awayScore,
      homePossessionTime: homePossessionTime ?? this.homePossessionTime,
      awayPossessionTime: awayPossessionTime ?? this.awayPossessionTime,
    );
  }
}
