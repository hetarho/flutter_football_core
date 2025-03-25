import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/entities/season/season.dart';

class League {
  int id;
  int gameSlotId;
  String name;
  Country country;
  int tier;
  List<Season> _seasons = [];
  List<Season> get seasons => _seasons;

  void setSeasons(List<Season> seasons) {
    _seasons = seasons;
  }

  League({
    required this.id,
    required this.gameSlotId,
    required this.name,
    required this.country,
    required this.tier,
  });

  @override
  String toString() {
    return 'League(id: $id, gameSlotId: $gameSlotId, name: $name, country: $country, tier: $tier)';
  }
}
