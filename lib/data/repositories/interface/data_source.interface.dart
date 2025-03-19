import 'package:flutter_football_core/entities/game-slot/game_slot.dart';

abstract class DataSource {
  Future<int> createGameSlot({required String saveName});
  Future<GameSlot> getGameSlot(int id);
  Future<List<GameSlot>> getAllGameSlots();
  Future<void> updateGameSlot({
    required int id,
    String? saveName,
  });
  Future<void> deleteGameSlot(int id);
}
