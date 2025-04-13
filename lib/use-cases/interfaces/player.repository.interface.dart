import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/entities/player/player.dart';

abstract class PlayerRepository {
  /// Create a new player
  Future<int> createPlayer({
    required String name,
    required Position position,
    required int age,
    required int stat,
    int? clubId,
    required int gameSlotId,
    int? backNumber,
    bool? isStarting,
    required Country country,
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

  /// Get all players by game slot id
  Future<List<Player>> getAllPlayersByGameSlotId(int gameSlotId);
}
