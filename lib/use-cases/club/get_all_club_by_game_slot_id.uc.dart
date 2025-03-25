import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:flutter_football_core/use-cases/interfaces/player.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetAllClubByGameSlotIdUsecase extends Usecase<List<Club>, GetAllClubByGameSlotIdParams> {
  final ClubRepository _clubRepository;
  final PlayerRepository _playerRepository;

  GetAllClubByGameSlotIdUsecase()
      : _clubRepository = GetIt.I.get<ClubRepository>(),
        _playerRepository = GetIt.I.get<PlayerRepository>();

  @override
  Future<List<Club>> execute(GetAllClubByGameSlotIdParams params) async {
    List<Club> clubs = await _clubRepository.getAllClubsByGameSlotId(params.gameSlotId);

    for (Club club in clubs) {
      List<Player> players = await _playerRepository.getAllPlayersByClubId(club.id);
      club.setPlayers(players);
    }

    return clubs;
  }
}

class GetAllClubByGameSlotIdParams {
  final int gameSlotId;

  GetAllClubByGameSlotIdParams({required this.gameSlotId});
}
