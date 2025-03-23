import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/entities/league/league.dart';

/// LeagueRepository is a repository that manages leagues
abstract class LeagueRepository {
  /// Create a new league
  Future<int> createLeague({
    required String name,
    required int gameSlotId,
    required Country country,
    required int tier,
  });

  /// Get a league by id
  Future<League> getLeague(int id);

  /// Get all leagues by game slot id
  Future<List<League>> getAllLeaguesByGameSlotId(int gameSlotId);

  /// Delete a league
  Future<void> deleteLeague(int id);

  /// Delete a league by game slot id
  Future<void> deleteLeagueByGameSlotId(int gameSlotId);
}
