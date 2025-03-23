import 'package:flutter_football_core/adapters/_adapter.dart';
import 'package:flutter_football_core/adapters/country.adapter.dart';
import 'package:flutter_football_core/data/model/league.model.dart';
import 'package:flutter_football_core/entities/league/league.dart';

class LeagueAdapter implements EntityModelAdapter<League, LeagueModel> {
  final CountryAdapter _countryAdapter = CountryAdapter();

  @override
  League toEntity(LeagueModel model) => League(
        id: model.id,
        name: model.name,
        gameSlotId: model.gameSlotId,
        country: _countryAdapter.toEntity(model.country),
        tier: model.tier,
      );

  @override
  LeagueModel toModel(League entity) => LeagueModel(
        id: entity.id,
        name: entity.name,
        gameSlotId: entity.gameSlotId,
        country: _countryAdapter.toModel(entity.country),
        tier: entity.tier,
      );
}
