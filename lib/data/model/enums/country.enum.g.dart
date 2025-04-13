// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCountryAdapter extends TypeAdapter<HiveCountry> {
  @override
  final int typeId = 100;

  @override
  HiveCountry read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return HiveCountry.england;
      case 1:
        return HiveCountry.spain;
      case 2:
        return HiveCountry.italy;
      case 3:
        return HiveCountry.germany;
      case 4:
        return HiveCountry.france;
      case 5:
        return HiveCountry.portugal;
      case 6:
        return HiveCountry.argentina;
      case 7:
        return HiveCountry.brazil;
      case 8:
        return HiveCountry.colombia;
      case 9:
        return HiveCountry.chile;
      case 10:
        return HiveCountry.uruguay;
      case 11:
        return HiveCountry.japan;
      case 12:
        return HiveCountry.korea;
      case 13:
        return HiveCountry.china;
      case 14:
        return HiveCountry.india;
      case 15:
        return HiveCountry.australia;
      case 16:
        return HiveCountry.southAfrica;
      case 17:
        return HiveCountry.mexico;
      case 18:
        return HiveCountry.usa;
      case 19:
        return HiveCountry.canada;
      default:
        return HiveCountry.england;
    }
  }

  @override
  void write(BinaryWriter writer, HiveCountry obj) {
    switch (obj) {
      case HiveCountry.england:
        writer.writeByte(0);
      case HiveCountry.spain:
        writer.writeByte(1);
      case HiveCountry.italy:
        writer.writeByte(2);
      case HiveCountry.germany:
        writer.writeByte(3);
      case HiveCountry.france:
        writer.writeByte(4);
      case HiveCountry.portugal:
        writer.writeByte(5);
      case HiveCountry.argentina:
        writer.writeByte(6);
      case HiveCountry.brazil:
        writer.writeByte(7);
      case HiveCountry.colombia:
        writer.writeByte(8);
      case HiveCountry.chile:
        writer.writeByte(9);
      case HiveCountry.uruguay:
        writer.writeByte(10);
      case HiveCountry.japan:
        writer.writeByte(11);
      case HiveCountry.korea:
        writer.writeByte(12);
      case HiveCountry.china:
        writer.writeByte(13);
      case HiveCountry.india:
        writer.writeByte(14);
      case HiveCountry.australia:
        writer.writeByte(15);
      case HiveCountry.southAfrica:
        writer.writeByte(16);
      case HiveCountry.mexico:
        writer.writeByte(17);
      case HiveCountry.usa:
        writer.writeByte(18);
      case HiveCountry.canada:
        writer.writeByte(19);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCountryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
