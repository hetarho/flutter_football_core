class Fixture {
  final int id;
  final int gameSlotId;
  final int leagueId;
  final int seasonId;
  final int homeClubId;
  final int awayClubId;
  final DateTime date;
  final int homeScore;
  final int awayScore;
  final Duration homePossessionTime;
  final Duration awayPossessionTime;

  Fixture({
    required this.id,
    required this.gameSlotId,
    required this.leagueId,
    required this.seasonId,
    required this.homeClubId,
    required this.awayClubId,
    required this.date,
    required this.homeScore,
    required this.awayScore,
    required this.homePossessionTime,
    required this.awayPossessionTime,
  });

  @override
  String toString() {
    return 'Fixture(id: $id, gameSlotId: $gameSlotId, leagueId: $leagueId, seasonId: $seasonId, homeClubId: $homeClubId, awayClubId: $awayClubId, date: $date, homeScore: $homeScore, awayScore: $awayScore, homePossessionTime: $homePossessionTime, awayPossessionTime: $awayPossessionTime)';
  }
}
