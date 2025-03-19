import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/create_game_slot.uc.dart';

/// GameSlotRepository is a repository that manages game slots
abstract class GameSlotRepository {
  /// Create a new game slot
  Future<int> createGameSlot(CreateGameSlotParams params);

  /// Get a game slot by id
  Future<GameSlot> getGameSlot(int id);

  /// Get all game slots
  Future<List<GameSlot>> getAllGameSlots();

  /// Update a game slot
  Future<void> updateGameSlot(GameSlot gameSlot);

  /// Delete a game slot
  Future<void> deleteGameSlot(int id);
}
