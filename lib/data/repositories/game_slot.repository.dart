import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';

class GameSlotRepositoryImpl implements GameSlotRepository {
  final DataSource _dataSource;

  GameSlotRepositoryImpl(DataSource dataSource) : _dataSource = dataSource;

  @override
  Future<int> createGameSlot({required String saveName}) async {
    return await _dataSource.createGameSlot(saveName: saveName);
  }

  @override
  Future<void> deleteGameSlot(int id) async {
    return await _dataSource.deleteGameSlot(id);
  }

  @override
  Future<List<GameSlot>> getAllGameSlots() async {
    return await _dataSource.getAllGameSlots();
  }

  @override
  Future<GameSlot> getGameSlot(int id) async {
    return await _dataSource.getGameSlot(id);
  }

  @override
  Future<void> updateGameSlot({required int id, String? saveName, int? selectedClubId}) async {
    return await _dataSource.updateGameSlot(id: id, saveName: saveName, selectedClubId: selectedClubId);
  }
}
