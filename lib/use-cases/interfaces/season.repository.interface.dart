import 'package:flutter_football_core/entities/season/season.dart';

abstract class SeasonRepository {
  Future<int> createSeason({
    required int leagueId,
    required int gameSlotId,
    required DateTime startDate,
    required DateTime endDate,
  });
  Future<List<Season>> getAllSeasonsByLeagueId(int leagueId);
}
