import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:get_it/get_it.dart';

class RecodeFixtureResultUsecase extends Usecase<void, RecodeFixtureResultParams> {
  final ClubRepository _clubRepository;

  RecodeFixtureResultUsecase() : _clubRepository = GetIt.I.get<ClubRepository>();

  @override
  Future<void> execute(RecodeFixtureResultParams params) async {
    Club club = await _clubRepository.getClub(params.clubId);

    int win = club.win + (params.goal > params.goalAgainst ? 1 : 0);
    int draw = club.draw + (params.goal == params.goalAgainst ? 1 : 0);
    int lose = club.lose + (params.goal < params.goalAgainst ? 1 : 0);

    int goal = club.goal + params.goal;
    int goalAgainst = club.goalAgainst + params.goalAgainst;

    await _clubRepository.updateClub(id: params.clubId, win: win, draw: draw, lose: lose, goal: goal, goalAgainst: goalAgainst);
  }
}

class RecodeFixtureResultParams {
  final int clubId;
  final int goal;
  final int goalAgainst;

  RecodeFixtureResultParams({required this.clubId, required this.goal, required this.goalAgainst});
}
