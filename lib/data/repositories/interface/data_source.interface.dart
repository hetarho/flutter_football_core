import 'package:flutter_football_core/entities/club/club.dart';
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

  Future<int> createClub({required String name, required int gameSlotId});
  Future<Club> getClub(int id);
  Future<List<Club>> getAllClubs();
  Future<void> updateClub({
    required int id,
    String? name,
    int? win,
    int? draw,
    int? lose,
    int? goal,
    int? goalAgainst,
  });
  Future<void> deleteClub(int id);
  Future<void> deleteClubByGameSlotId(int gameSlotId);
  Future<List<Club>> getAllClubsByGameSlotId(int gameSlotId);
}
