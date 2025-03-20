import 'package:flutter_football_core/entities/club/club.dart';

/// GameSlotRepository is a repository that manages game slots
abstract class ClubRepository {
  /// Create a new game slot
  Future<int> createClub({required String name, required int gameSlotId});

  /// Get a game slot by id
  Future<Club> getClub(int id);

  /// Get all game slots
  Future<List<Club>> getAllClubs();

  /// Get all clubs by game slot id
  Future<List<Club>> getAllClubsByGameSlotId(int gameSlotId);

  /// Update a club
  Future<void> updateClub({
    required int id,
    String? name,
    int? win,
    int? draw,
    int? lose,
    int? goal,
    int? goalAgainst,
  });

  /// Delete a club
  Future<void> deleteClub(int id);

  /// Delete a club by game slot id
  Future<void> deleteClubByGameSlotId(int gameSlotId);
}
