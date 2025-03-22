import 'package:flutter_football_core/entities/player/player.dart';

class Club {
  final int id;
  final String name;
  final int gameSlotId;

  List<Player> players = [];
  List<Player> get startingPlayers => players.where((player) => player.isStarting ?? false).toList();
  int get stat => players.fold(0, (sum, player) => sum + player.stat);

  int win;
  int draw;
  int lose;
  int get pts => win * 3 + draw;

  int goal;
  int goalAgainst;
  int get goalDifference => goal - goalAgainst;

  Club(
      {required this.id,
      required this.name,
      required this.gameSlotId,
      required this.win,
      required this.draw,
      required this.lose,
      required this.goal,
      required this.goalAgainst});

  @override
  String toString() {
    return 'Club(id: $id, name: $name, gameSlotId: $gameSlotId)';
  }
}
