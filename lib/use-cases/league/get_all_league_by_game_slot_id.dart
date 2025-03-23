  import 'package:flutter_football_core/entities/league/league.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/league.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetAllLeagueByGameSlotIdUsecase extends Usecase<List<League>, GetAllLeagueByGameSlotIdParams> {
  final LeagueRepository _leagueRepository;

  GetAllLeagueByGameSlotIdUsecase()
      : _leagueRepository = GetIt.I.get<LeagueRepository>();

  @override
  Future<List<League>> execute(GetAllLeagueByGameSlotIdParams params) async {
    List<League> leagues = await _leagueRepository.getAllLeaguesByGameSlotId(params.gameSlotId);

    return leagues;
  }
}

class GetAllLeagueByGameSlotIdParams {  
  final int gameSlotId;

  GetAllLeagueByGameSlotIdParams({required this.gameSlotId});
}
