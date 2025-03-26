import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/fixture.repository.interface.dart';
import 'package:get_it/get_it.dart';

class CreateFixtureUsecase extends Usecase<int, CreateFixtureParams> {
  final FixtureRepository _fixtureRepository;

  CreateFixtureUsecase() : _fixtureRepository = GetIt.I.get<FixtureRepository>();

  @override
  Future<int> execute(CreateFixtureParams params) async {
    return await _fixtureRepository.createFixture(
        gameSlotId: params.gameSlotId, leagueId: params.leagueId, seasonId: params.seasonId, homeClubId: params.homeClubId, awayClubId: params.awayClubId, date: params.date);
  }
}

class CreateFixtureParams {
  final int gameSlotId;
  final int leagueId;
  final int seasonId;
  final int homeClubId;
  final int awayClubId;
  final DateTime date;

  CreateFixtureParams({required this.gameSlotId, required this.leagueId, required this.seasonId, required this.homeClubId, required this.awayClubId, required this.date});
}
