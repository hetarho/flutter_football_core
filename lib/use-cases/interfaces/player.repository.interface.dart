import 'package:flutter_football_core/entities/player/player.dart';

abstract class PlayerRepository {
  /// Create a new player
  Future<int> createPlayer({
    required String name,
    required Position position,
    required int age,
    required int stat,
    required int clubId,
    required int gameSlotId,
  });

  /// Get all players by club id
  Future<List<Player>> getAllPlayersByClubId(int clubId);

  /// Delete a player by game slot id
  Future<void> deletePlayerByGameSlotId(int gameSlotId);

  /// Update a player
  Future<void> updatePlayer({
    required int id,
    Position? position,
    int? age,
    int? stat,
    int? clubId,
    int? backNumber,
    bool? isStarting,
  });
}
