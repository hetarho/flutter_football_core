import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';

class ClubRepositoryImpl implements ClubRepository {
  final DataSource _dataSource;

  ClubRepositoryImpl(DataSource dataSource) : _dataSource = dataSource;

  @override
  Future<int> createClub({required String name, required int gameSlotId}) async {
    return await _dataSource.createClub(name: name, gameSlotId: gameSlotId);
  }

  @override
  Future<void> deleteClub(int id) async {
    return await _dataSource.deleteClub(id);
  }

  @override
  Future<List<Club>> getAllClubs() async {
    return await _dataSource.getAllClubs();
  }

  @override
  Future<List<Club>> getAllClubsByGameSlotId(int gameSlotId) async {
    return await _dataSource.getAllClubsByGameSlotId(gameSlotId);
  }

  @override
  Future<Club> getClub(int id) async {
    return await _dataSource.getClub(id);
  }

  @override
  Future<void> updateClub({required int id, String? name, int? win, int? draw, int? lose, int? goal, int? goalAgainst}) async {
    return await _dataSource.updateClub(id: id, name: name, win: win, draw: draw, lose: lose, goal: goal, goalAgainst: goalAgainst);
  }

  @override
  Future<void> deleteClubByGameSlotId(int gameSlotId) async {
    return await _dataSource.deleteClubByGameSlotId(gameSlotId);
  }
}
