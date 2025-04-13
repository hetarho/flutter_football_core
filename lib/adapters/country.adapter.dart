import 'package:flutter_football_core/adapters/_adapter.dart';
import 'package:flutter_football_core/data/model/enums/country.enum.dart';
import 'package:flutter_football_core/entities/country.enum.dart';

class CountryAdapter implements EntityModelAdapter<Country, HiveCountry> {
  @override
  Country toEntity(HiveCountry model) => Country.values[model.index];

  @override
  HiveCountry toModel(Country entity) => HiveCountry.values[entity.index];
}