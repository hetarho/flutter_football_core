import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/create_game_slot.uc.dart';

abstract class DataSource {
  Future<int> createGameSlot(CreateGameSlotParams params);
  Future<GameSlot> getGameSlot(int id);
  Future<List<GameSlot>> getAllGameSlots();
  Future<void> updateGameSlot(GameSlot gameSlot);
  Future<void> deleteGameSlot(int id);
}
