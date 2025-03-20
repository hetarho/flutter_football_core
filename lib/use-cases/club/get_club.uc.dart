import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetClubUsecase extends Usecase<Club, GetClubParams> {
  final ClubRepository _clubRepository;

  GetClubUsecase() : _clubRepository = GetIt.I.get<ClubRepository>();

  @override
  Future<Club> execute(GetClubParams params) async {
    return await _clubRepository.getClub(params.id);
  }
}

class GetClubParams {
  final int id;

  GetClubParams({required this.id});
}
