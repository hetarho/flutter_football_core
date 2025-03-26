import 'package:flutter_football_core/adapters/_adapter.dart';
import 'package:flutter_football_core/data/model/fixture.model.dart';
import 'package:flutter_football_core/entities/fixture/fixture.dart';

class FixtureAdapter implements EntityModelAdapter<Fixture, FixtureModel> {
  @override
  Fixture toEntity(FixtureModel model) {
    return Fixture(
      id: model.id,
      leagueId: model.leagueId,
      gameSlotId: model.gameSlotId,
      seasonId: model.seasonId,
      homeClubId: model.homeClubId,
      awayClubId: model.awayClubId,
      date: model.date,
      homeScore: model.homeScore,
      awayScore: model.awayScore,
      homePossessionTime: model.homePossessionTime,
      awayPossessionTime: model.awayPossessionTime,
    );
  }

  @override
  FixtureModel toModel(Fixture entity) {
    return FixtureModel(
      id: entity.id,
      leagueId: entity.leagueId,
      gameSlotId: entity.gameSlotId,
      seasonId: entity.seasonId,
      homeClubId: entity.homeClubId,
      awayClubId: entity.awayClubId,
      date: entity.date,
      homeScore: entity.homeScore,
      awayScore: entity.awayScore,
      homePossessionTime: entity.homePossessionTime,
      awayPossessionTime: entity.awayPossessionTime,
    );
  }
}
