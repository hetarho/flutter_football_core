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
