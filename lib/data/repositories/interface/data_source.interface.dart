import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/entities/league/league.dart';
import 'package:flutter_football_core/entities/player/player.dart';

abstract class DataSource {
  Future<int> createGameSlot({required String saveName});
  Future<GameSlot> getGameSlot(int id);
  Future<List<GameSlot>> getAllGameSlots();
  Future<void> updateGameSlot({
    required int id,
    String? saveName,
  });
  Future<void> deleteGameSlot(int id);

  Future<int> createClub({required String name, required int gameSlotId, required int leagueId});
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
  Future<List<Club>> getAllClubsByLeagueId(int leagueId);

  Future<int> createPlayer(
      {required String name, required Position position, required int age, required int stat, required int clubId, required int gameSlotId});
  Future<List<Player>> getAllPlayersByClubId(int clubId);
  Future<void> deletePlayerByGameSlotId(int gameSlotId);

  Future<int> createLeague({required String name, required int gameSlotId, required Country country, required int tier});
  Future<League> getLeague(int id);
  Future<List<League>> getAllLeaguesByGameSlotId(int gameSlotId);
  Future<void> deleteLeague(int id);
  Future<void> deleteLeagueByGameSlotId(int gameSlotId);
}
