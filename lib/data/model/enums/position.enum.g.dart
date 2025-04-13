// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HivePositionAdapter extends TypeAdapter<HivePosition> {
  @override
  final int typeId = 101;

  @override
  HivePosition read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HivePosition.forward;
      case 1:
        return HivePosition.midfield;
      case 2:
        return HivePosition.defense;
      case 3:
        return HivePosition.goalie;
      default:
        return HivePosition.forward;
    }
  }

  @override
  void write(BinaryWriter writer, HivePosition obj) {
    switch (obj) {
      case HivePosition.forward:
        writer.writeByte(0);
      case HivePosition.midfield:
        writer.writeByte(1);
      case HivePosition.defense:
        writer.writeByte(2);
      case HivePosition.goalie:
        writer.writeByte(3);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HivePositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
