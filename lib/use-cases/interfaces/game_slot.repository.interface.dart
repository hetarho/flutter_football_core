import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/entities/fixture/fixture.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/entities/player/player.dart';

/// GameSlotRepository is a repository that manages game slots
abstract class GameSlotRepository {
  /// Create a new game slot
  Future<int> createGameSlot({required String saveName});

  /// Get a game slot by id
  Future<GameSlot> getGameSlot(int id);

  /// Get all game slots
  Future<List<GameSlot>> getAllGameSlots();

  /// Update a game slot
  Future<void> updateGameSlot({required int id, String? saveName});

  /// Delete a game slot
  Future<void> deleteGameSlot(int id);
}
