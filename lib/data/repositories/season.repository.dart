import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/entities/season/season.dart';
import 'package:flutter_football_core/use-cases/interfaces/season.repository.interface.dart';

class SeasonRepositoryImpl extends SeasonRepository {
  final DataSource _dataSource;

  SeasonRepositoryImpl(DataSource dataSource) : _dataSource = dataSource;

  @override
  Future<int> createSeason({required int leagueId, required int gameSlotId, required DateTime startDate, required DateTime endDate}) async {
    return await _dataSource.createSeason(leagueId: leagueId, gameSlotId: gameSlotId, startDate: startDate, endDate: endDate);
  }

  @override
  Future<List<Season>> getAllSeasonsByLeagueId(int leagueId) async {
    return await _dataSource.getAllSeasonsByLeagueId(leagueId);
  }
}
