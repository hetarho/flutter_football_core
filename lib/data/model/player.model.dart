import 'package:flutter_football_core/data/model/enums/country.enum.dart';
import 'package:flutter_football_core/data/model/enums/position.enum.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

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
  HiveCountry country;
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
    required this.country,
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
    HiveCountry? country,
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
      country: country ?? this.country,
    );
  }
}
