import 'package:hive_ce_flutter/hive_flutter.dart';

class GameSlotModel extends HiveObject {
  static const String boxName = 'game_slot';
  static const String lastIdBoxName = 'game_slot_last_id';

  late final int id;
  late final String saveName;
  late final DateTime createAt;
  late final DateTime updateAt;
  late final DateTime? inGameTime;
  late final int? selectedClubId;

  GameSlotModel({required this.id, required this.saveName, required this.createAt, required this.updateAt, this.inGameTime, this.selectedClubId});

  GameSlotModel copyWith({String? saveName, DateTime? updateAt, DateTime? inGameTime, int? selectedClubId}) {
    return GameSlotModel(
      id: id,
      saveName: saveName ?? this.saveName,
      createAt: createAt,
      updateAt: updateAt ?? this.updateAt,
      inGameTime: inGameTime ?? this.inGameTime,
      selectedClubId: selectedClubId ?? this.selectedClubId,
    );
  }

  @override
  String toString() {
    return 'GameSlotModel(id: $id, saveName: $saveName, createAt: $createAt, updateAt: $updateAt, inGameTime: $inGameTime, selectedClubId: $selectedClubId)';
  }
}
