import 'package:flutter_football_core/entities/player/player.dart';

abstract class PlayerRepository {
  Future<int> createPlayer({
    required String name,
    required Position position,
    required int age,
    required int stat,
    required int clubId,
    required int gameSlotId,
  });
  Future<List<Player>> getAllPlayersByClubId(int clubId);
  Future<void> deletePlayerByGameSlotId(int gameSlotId);
}
