import 'package:flutter_football_core/entities/fixture/fixture.dart';

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

  List<Fixture> _fixtures = [];
  List<Fixture> get fixtures => _fixtures;

  void setFixtures(List<Fixture> fixtures) {
    _fixtures = fixtures;
  }

  Season({
    required this.id,
    required this.gameSlotId,
    required this.leagueId,
    required this.startDate,
    required this.endDate,
  });

  @override
  String toString() {
    return 'Season(id: $id, gameSlotId: $gameSlotId, leagueId: $leagueId, startDate: $startDate, endDate: $endDate)';
  }
}
