import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:get_it/get_it.dart';

class UpdateClubUsecase extends Usecase<void, UpdateClubParams> {
  final ClubRepository _clubRepository;

  UpdateClubUsecase() : _clubRepository = GetIt.I.get<ClubRepository>();

  @override
  Future<void> execute(UpdateClubParams params) async {
    await _clubRepository.updateClub(
      id: params.club.id,
      name: params.club.name,
      win: params.club.win,
      draw: params.club.draw,
      lose: params.club.lose,
      goal: params.club.goal,
      goalAgainst: params.club.goalAgainst,
    );
  }
}

class UpdateClubParams {
  final Club club;

  UpdateClubParams({required this.club});
}
