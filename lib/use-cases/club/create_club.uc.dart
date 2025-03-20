import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:get_it/get_it.dart';

class CreateClubUsecase {
  final ClubRepository _clubRepository;

  CreateClubUsecase() : _clubRepository = GetIt.I.get<ClubRepository>();

  Future<int> execute(CreateClubParams params) async {
    return await _clubRepository.createClub(name: params.name, gameSlotId: params.gameSlotId);
  }
}

class CreateClubParams {
  final String name;
  final int gameSlotId;

  CreateClubParams({required this.name, required this.gameSlotId});
}
