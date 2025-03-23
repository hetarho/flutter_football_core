import 'package:flutter_football_core/data/model/country.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class LeagueModel extends HiveObject {
  static const String boxName = 'league';
  static const String lastIdBoxName = 'league_last_id';

  late final int id;
  late final int gameSlotId;
  late final String name;
  late final HiveLeagueCountry country;
  late final int tier;

  LeagueModel({
    required this.id,
    required this.gameSlotId,
    required this.name,
    required this.country,
    required this.tier,
  });
}
