import 'package:hive_ce_flutter/hive_flutter.dart';

class ClubModel extends HiveObject {
  static const String boxName = 'club';
  static const String lastIdBoxName = 'club_last_id';

  late final int id;
  late final String name;
  late final int gameSlotId;
  late final int win;
  late final int draw;
  late final int lose;
  late final int goal;
  late final int goalAgainst;
  late final int leagueId;
  ClubModel({
    required this.id,
    required this.name,
    required this.gameSlotId,
    required this.leagueId,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goal,
    required this.goalAgainst,
  });

  ClubModel copyWith({String? name, int? win, int? draw, int? lose, int? goal, int? goalAgainst, int? leagueId}) {
    return ClubModel(
      id: id,
      name: name ?? this.name,
      gameSlotId: gameSlotId,
      leagueId: leagueId ?? this.leagueId,
      win: win ?? this.win,
      draw: draw ?? this.draw,
      lose: lose ?? this.lose,
      goal: goal ?? this.goal,
      goalAgainst: goalAgainst ?? this.goalAgainst,
    );
  }
}
