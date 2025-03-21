import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/player.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetAllPlayerByClubIdUsecase extends Usecase<List<Player>, GetAllPlayerByClubIdParams> {
  final PlayerRepository _playerRepository;

  GetAllPlayerByClubIdUsecase() : _playerRepository = GetIt.I.get<PlayerRepository>();

  @override
  Future<List<Player>> execute(GetAllPlayerByClubIdParams params) async {
    return _playerRepository.getAllPlayersByClubId(params.clubId);
  }
}

class GetAllPlayerByClubIdParams {
  final int clubId;

  GetAllPlayerByClubIdParams({required this.clubId});
}
