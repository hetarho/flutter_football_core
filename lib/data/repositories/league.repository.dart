import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/entities/league/league.dart';
import 'package:flutter_football_core/use-cases/interfaces/league.repository.interface.dart';

class LeagueRepositoryImpl implements LeagueRepository {
  final DataSource _dataSource;

  LeagueRepositoryImpl(DataSource dataSource) : _dataSource = dataSource;

  @override
  Future<int> createLeague({required String name, required int gameSlotId, required Country country, required int tier}) async {
    return await _dataSource.createLeague(name: name, gameSlotId: gameSlotId, country: country, tier: tier);
  }

  @override
  Future<void> deleteLeague(int id) async {
    return await _dataSource.deleteLeague(id);
  }

  @override
  Future<void> deleteLeagueByGameSlotId(int gameSlotId) async {
    return await _dataSource.deleteLeagueByGameSlotId(gameSlotId);
  }

  @override
  Future<League> getLeague(int id) async {
    return await _dataSource.getLeague(id);
  }

  @override
  Future<List<League>> getAllLeaguesByGameSlotId(int gameSlotId) async {
    return await _dataSource.getAllLeaguesByGameSlotId(gameSlotId);
  }
}
