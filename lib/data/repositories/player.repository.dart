import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/interfaces/player.repository.interface.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final DataSource _dataSource;

  PlayerRepositoryImpl(DataSource dataSource) : _dataSource = dataSource;

  @override
  Future<int> createPlayer(
      {required String name, required Position position, required int age, required int stat, int? clubId, required int gameSlotId, int? backNumber, bool? isStarting}) async {
    return await _dataSource.createPlayer(name: name, position: position, age: age, stat: stat, clubId: clubId, gameSlotId: gameSlotId, backNumber: backNumber, isStarting: isStarting);
  }

  @override
  Future<List<Player>> getAllPlayersByClubId(int clubId) async {
    return await _dataSource.getAllPlayersByClubId(clubId);
  }

  @override
  Future<void> deletePlayerByGameSlotId(int gameSlotId) async {
    return await _dataSource.deletePlayerByGameSlotId(gameSlotId);
  }

  @override
  Future<void> updatePlayer({int? age, int? backNumber, int? clubId, required int id, bool? isStarting, Position? position, int? stat}) async {
    return await _dataSource.updatePlayer(age: age, backNumber: backNumber, clubId: clubId, id: id, isStarting: isStarting, position: position, stat: stat);
  }

  @override
  Future<List<Player>> getAllPlayersByGameSlotId(int gameSlotId) async {
    return await _dataSource.getAllPlayersByGameSlotId(gameSlotId);
  }
}
