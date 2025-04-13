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
      inGameTime: fields[5] as DateTime?,
      selectedClubId: (fields[4] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, GameSlotModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.saveName)
      ..writeByte(2)
      ..write(obj.createAt)
      ..writeByte(3)
      ..write(obj.updateAt)
      ..writeByte(4)
      ..write(obj.selectedClubId)
      ..writeByte(5)
      ..write(obj.inGameTime);
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
      leagueId: (fields[8] as num).toInt(),
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
      ..writeByte(9)
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
      ..write(obj.goalAgainst)
      ..writeByte(8)
      ..write(obj.leagueId);
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

class PlayerModelAdapter extends TypeAdapter<PlayerModel> {
  @override
  final int typeId = 2;

  @override
  PlayerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerModel(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      position: fields[3] as HivePosition,
      age: (fields[4] as num).toInt(),
      stat: (fields[6] as num).toInt(),
      clubId: (fields[8] as num?)?.toInt(),
      gameSlotId: (fields[2] as num).toInt(),
      backNumber: (fields[5] as num?)?.toInt(),
      isStarting: fields[7] as bool?,
      country: fields[9] as HiveCountry,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.gameSlotId)
      ..writeByte(3)
      ..write(obj.position)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.backNumber)
      ..writeByte(6)
      ..write(obj.stat)
      ..writeByte(7)
      ..write(obj.isStarting)
      ..writeByte(8)
      ..write(obj.clubId)
      ..writeByte(9)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LeagueModelAdapter extends TypeAdapter<LeagueModel> {
  @override
  final int typeId = 3;

  @override
  LeagueModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LeagueModel(
      id: (fields[0] as num).toInt(),
      gameSlotId: (fields[1] as num).toInt(),
      name: fields[2] as String,
      country: fields[3] as HiveCountry,
      tier: (fields[4] as num).toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, LeagueModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.gameSlotId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.country)
      ..writeByte(4)
      ..write(obj.tier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeagueModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HivePositionAdapter extends TypeAdapter<HivePosition> {
  @override
  final int typeId = 5;

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

class SeasonModelAdapter extends TypeAdapter<SeasonModel> {
  @override
  final int typeId = 6;

  @override
  SeasonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeasonModel(
      id: (fields[0] as num).toInt(),
      leagueId: (fields[1] as num).toInt(),
      gameSlotId: (fields[2] as num).toInt(),
      startDate: fields[3] as DateTime,
      endDate: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SeasonModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.leagueId)
      ..writeByte(2)
      ..write(obj.gameSlotId)
      ..writeByte(3)
      ..write(obj.startDate)
      ..writeByte(4)
      ..write(obj.endDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FixtureModelAdapter extends TypeAdapter<FixtureModel> {
  @override
  final int typeId = 7;

  @override
  FixtureModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FixtureModel(
      id: (fields[0] as num).toInt(),
      leagueId: (fields[1] as num).toInt(),
      gameSlotId: (fields[2] as num).toInt(),
      seasonId: (fields[3] as num).toInt(),
      homeClubId: (fields[4] as num).toInt(),
      awayClubId: (fields[5] as num).toInt(),
      date: fields[6] as DateTime,
      homeScore: (fields[7] as num).toInt(),
      awayScore: (fields[8] as num).toInt(),
      homePossessionTime: fields[9] as Duration,
      awayPossessionTime: fields[10] as Duration,
    );
  }

  @override
  void write(BinaryWriter writer, FixtureModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.leagueId)
      ..writeByte(2)
      ..write(obj.gameSlotId)
      ..writeByte(3)
      ..write(obj.seasonId)
      ..writeByte(4)
      ..write(obj.homeClubId)
      ..writeByte(5)
      ..write(obj.awayClubId)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.homeScore)
      ..writeByte(8)
      ..write(obj.awayScore)
      ..writeByte(9)
      ..write(obj.homePossessionTime)
      ..writeByte(10)
      ..write(obj.awayPossessionTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FixtureModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveCountryAdapter extends TypeAdapter<HiveCountry> {
  @override
  final int typeId = 8;

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
