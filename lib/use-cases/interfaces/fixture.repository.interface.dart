import 'package:flutter_football_core/entities/fixture/fixture.dart';

abstract class FixtureRepository {
  /// Create a new fixture
  Future<int> createFixture({
    required int gameSlotId,
    required int leagueId,
    required int seasonId,
    required int homeClubId,
    required int awayClubId,
    required DateTime date,
  });

  /// Get all fixtures by league id
  Future<List<Fixture>> getFixturesByLeagueId(int leagueId);
}
