import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:flutter_football_core/use-cases/interfaces/player.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetClubByLeagueIdUsecase extends Usecase<List<Club>, GetClubByLeagueIdParams> {
  final ClubRepository _clubRepository;
  final PlayerRepository _playerRepository;

  GetClubByLeagueIdUsecase()
      : _clubRepository = GetIt.I.get<ClubRepository>(),
        _playerRepository = GetIt.I.get<PlayerRepository>();

  @override
  Future<List<Club>> execute(GetClubByLeagueIdParams params) async {
    List<Club> clubs = await _clubRepository.getAllClubsByLeagueId(params.leagueId);

    for (Club club in clubs) {
      List<Player> players = await _playerRepository.getAllPlayersByClubId(club.id);
      club.setPlayers(players);
    }

    return clubs;
  }
}

class GetClubByLeagueIdParams {
  final int leagueId;

  GetClubByLeagueIdParams({required this.leagueId});
}
