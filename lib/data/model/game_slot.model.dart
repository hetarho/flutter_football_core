import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class GameSlotModel extends HiveObject {
  late final int id;
  late final String saveName;
  late final DateTime createAt;
  late final DateTime updateAt;

  GameSlotModel.fromGameSlot(GameSlot gameSlot) {
    id = gameSlot.id;
    saveName = gameSlot.saveName;
    createAt = gameSlot.createAt;
    updateAt = gameSlot.updateAt;
  }

  GameSlotModel({required this.id, required this.saveName, required this.createAt, required this.updateAt});

  GameSlotModel copyWith({String? saveName, DateTime? updateAt}) {
    return GameSlotModel(
      id: id,
      saveName: saveName ?? this.saveName,
      createAt: createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
