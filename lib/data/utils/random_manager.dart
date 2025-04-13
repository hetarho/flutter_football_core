import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/use-cases/interfaces/random_manager.util.interface.dart';
import 'package:random_name_generator/random_name_generator.dart';

class RandomManagerImpl implements RandomManager {
  @override
  String generateRandomName({required Country country}) {
    Zone zone = ZoneAdapter().countryToZone(country);
    return RandomNames(zone).name();
  }
}

class ZoneAdapter {
  Zone countryToZone(Country country) {
    return switch (country) {
      Country.england => Zone.uk,
      Country.spain => Zone.spain,
      Country.italy => Zone.italy,
      Country.germany => Zone.germany,
      Country.france => Zone.france,
      Country.brazil => Zone.brazil,
      Country.japan => Zone.japan,
      Country.china => Zone.china,
      Country.india => Zone.india,
      Country.southAfrica => Zone.southAfrica,
      Country.usa => Zone.us,
      Country.canada => Zone.us,
      _ => Zone.us,
    };
  }
}
