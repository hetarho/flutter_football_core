import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/entities/fixture/fixture.dart';
import 'package:flutter_football_core/use-cases/interfaces/fixture.repository.interface.dart';

class FixtureRepositoryImpl extends FixtureRepository {
  final DataSource _dataSource;

  FixtureRepositoryImpl(DataSource dataSource) : _dataSource = dataSource;

  @override
  Future<int> createFixture({required int leagueId, required int gameSlotId, required int seasonId, required int homeClubId, required int awayClubId, required DateTime date}) async {
    return await _dataSource.createFixture(leagueId: leagueId, gameSlotId: gameSlotId, seasonId: seasonId, homeClubId: homeClubId, awayClubId: awayClubId, date: date);
  }

  @override
  Future<List<Fixture>> getFixturesByLeagueId(int leagueId) async {
    return await _dataSource.getFixturesByLeagueId(leagueId);
  }
}
