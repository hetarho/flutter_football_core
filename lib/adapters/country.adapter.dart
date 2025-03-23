import 'package:flutter_football_core/adapters/_adapter.dart';
import 'package:flutter_football_core/data/model/country.model.dart';
import 'package:flutter_football_core/entities/country.enum.dart';

class CountryAdapter implements EntityModelAdapter<Country, HiveLeagueCountry> {
  @override
  Country toEntity(HiveLeagueCountry model) => Country.values[model.index];

  @override
  HiveLeagueCountry toModel(Country entity) => HiveLeagueCountry.values[entity.index];
}