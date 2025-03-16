import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/use-cases/create_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';

class GameSlotRepositoryImpl implements GameSlotRepository {
  final DataSource dataSource;

  GameSlotRepositoryImpl({required this.dataSource});

  @override
  Future<int> createGameSlot(CreateGameSlotParams params) async {
    return dataSource.createGameSlot(params);
  }

  @override
  Future<void> deleteGameSlot(int id) async {
    return dataSource.deleteGameSlot(id);
  }

  @override
  Future<List<GameSlot>> getAllGameSlots() async {
    return dataSource.getAllGameSlots();
  }

  @override
  Future<GameSlot> getGameSlot(int id) async {
    return dataSource.getGameSlot(id);
  }

  @override
  Future<void> updateGameSlot(GameSlot gameSlot) async {
    return dataSource.updateGameSlot(gameSlot);
  }
}
