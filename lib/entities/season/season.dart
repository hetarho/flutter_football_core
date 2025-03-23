class Season {
  final int id;
  final int gameSlotId;
  final int leagueId;
  final DateTime startDate;
  final DateTime endDate;

  String get name {
    final startYear = startDate.year.toString().substring(2);
    final endYear = endDate.year.toString().substring(2);
    return '$startYear-$endYear';
  }

  Season({
    required this.id,
    required this.gameSlotId,
    required this.leagueId,
    required this.startDate,
    required this.endDate,
  });
}
