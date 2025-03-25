import 'package:flutter_football_core/entities/league/league.dart';
import 'package:flutter_football_core/entities/season/season.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/league.repository.interface.dart';
import 'package:flutter_football_core/use-cases/interfaces/season.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetAllLeagueByGameSlotIdUsecase extends Usecase<List<League>, GetAllLeagueByGameSlotIdParams> {
  final LeagueRepository _leagueRepository;
  final SeasonRepository _seasonRepository;

  GetAllLeagueByGameSlotIdUsecase()
      : _leagueRepository = GetIt.I.get<LeagueRepository>(),
        _seasonRepository = GetIt.I.get<SeasonRepository>();

  @override
  Future<List<League>> execute(GetAllLeagueByGameSlotIdParams params) async {
    List<League> leagues = await _leagueRepository.getAllLeaguesByGameSlotId(params.gameSlotId);

    for (League league in leagues) {
      List<Season> seasons = await _seasonRepository.getAllSeasonsByLeagueId(league.id);
      league.setSeasons(seasons);
    }

    return leagues;
  }
}

class GetAllLeagueByGameSlotIdParams {
  final int gameSlotId;

  GetAllLeagueByGameSlotIdParams({required this.gameSlotId});
}
