import 'package:hive_ce_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
enum HivePosition {
  @HiveField(0)
  forward,
  @HiveField(1)
  midfield,
  @HiveField(2)
  defense,
  @HiveField(3)
  goalie,
}

class PlayerModel extends HiveObject {
  static const String boxName = 'player';
  static const String lastIdBoxName = 'player_last_id';

  final int id;
  final String name;
  final int gameSlotId;

  HivePosition position;
  int age;
  int? backNumber;
  int stat;
  bool? isStarting;

  int? clubId;

  PlayerModel({
    required this.id,
    required this.name,
    required this.position,
    required this.age,
    required this.stat,
    required this.clubId,
    required this.gameSlotId,
    this.backNumber,
    this.isStarting,
  });

  PlayerModel copyWith({
    int? id,
    String? name,
    HivePosition? position,
    int? age,
    int? backNumber,
    int? stat,
    bool? isStarting,
    int? clubId,
    int? gameSlotId,
  }) {
    return PlayerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      position: position ?? this.position,
      age: age ?? this.age,
      backNumber: backNumber ?? this.backNumber,
      stat: stat ?? this.stat,
      clubId: clubId ?? this.clubId,
      gameSlotId: gameSlotId ?? this.gameSlotId,  
      isStarting: isStarting ?? this.isStarting,
    );
  }
}
