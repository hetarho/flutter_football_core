import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetAllClubByGameSlotIdUsecase extends Usecase<List<Club>, GetAllClubByGameSlotIdParams> {
  final ClubRepository _clubRepository;

  GetAllClubByGameSlotIdUsecase() : _clubRepository = GetIt.I.get<ClubRepository>();

  @override
  Future<List<Club>> execute(GetAllClubByGameSlotIdParams params) async {
    return _clubRepository.getAllClubsByGameSlotId(params.gameSlotId);
  }
}

class GetAllClubByGameSlotIdParams {
  final int gameSlotId;

  GetAllClubByGameSlotIdParams({required this.gameSlotId});
}
