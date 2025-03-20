import 'package:flutter_football_core/entities/club/club.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class ClubModel extends HiveObject {
  late final int id;
  late final String name;
  late final int gameSlotId;
  late final int win;
  late final int draw;
  late final int lose;
  late final int goal;
  late final int goalAgainst;

  ClubModel.fromClub(Club club) {
    id = club.id;
    name = club.name;
    gameSlotId = club.gameSlotId;
    win = club.win;
    draw = club.draw;
    lose = club.lose;
    goal = club.goal;
    goalAgainst = club.goalAgainst;
  }

  ClubModel({
    required this.id,
    required this.name,
    required this.gameSlotId,
    required this.win,
    required this.draw,
    required this.lose,
    required this.goal,
    required this.goalAgainst,
  });

  ClubModel copyWith({String? name, int? win, int? draw, int? lose, int? goal, int? goalAgainst}) {
    return ClubModel(
      id: id,
      name: name ?? this.name,
      gameSlotId: gameSlotId,
      win: win ?? this.win,
      draw: draw ?? this.draw,
      lose: lose ?? this.lose,
      goal: goal ?? this.goal,
      goalAgainst: goalAgainst ?? this.goalAgainst,
    );
  }
}
