import 'package:flutter_football_core/entities/country.enum.dart';

class Player {
  final int id;
  final String name;
  final int gameSlotId;
  int? clubId;

  Position position;
  int age;
  int? backNumber;
  int stat;
  bool? isStarting;
  Country country;

  Player({
    required this.id,
    required this.name,
    required this.position,
    required this.age,
    this.backNumber,
    required this.stat,
    required this.clubId,
    required this.gameSlotId,
    this.isStarting,
    required this.country,
  });

  @override
  String toString() {
    return 'Player(id: $id, name: $name, position: $position, age: $age, backNumber: $backNumber, stat: $stat, clubId: $clubId, gameSlotId: $gameSlotId, isStarting: $isStarting)';
  }
}

enum Position {
  forward,
  midfield,
  defense,
  goalie,
}
