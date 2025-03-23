import 'package:flutter_football_core/entities/country.enum.dart';

class League {
  int id;
  int gameSlotId;
  String name;
  Country country;
  int tier;

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
