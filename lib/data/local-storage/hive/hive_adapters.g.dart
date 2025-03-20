// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class GameSlotModelAdapter extends TypeAdapter<GameSlotModel> {
  @override
  final int typeId = 0;

  @override
  GameSlotModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameSlotModel(
      id: (fields[0] as num).toInt(),
      saveName: fields[1] as String,
      createAt: fields[2] as DateTime,
      updateAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, GameSlotModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.saveName)
      ..writeByte(2)
      ..write(obj.createAt)
      ..writeByte(3)
      ..write(obj.updateAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameSlotModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ClubModelAdapter extends TypeAdapter<ClubModel> {
  @override
  final int typeId = 1;

  @override
  ClubModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClubModel(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      gameSlotId: (fields[2] as num).toInt(),
      win: (fields[3] as num).toInt(),
      draw: (fields[4] as num).toInt(),
      lose: (fields[5] as num).toInt(),
      goal: (fields[6] as num).toInt(),
      goalAgainst: (fields[7] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, ClubModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.gameSlotId)
      ..writeByte(3)
      ..write(obj.win)
      ..writeByte(4)
      ..write(obj.draw)
      ..writeByte(5)
      ..write(obj.lose)
      ..writeByte(6)
      ..write(obj.goal)
      ..writeByte(7)
      ..write(obj.goalAgainst);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClubModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
