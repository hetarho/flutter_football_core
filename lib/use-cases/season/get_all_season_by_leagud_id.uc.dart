import 'package:flutter_football_core/entities/season/season.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/season.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetAllSeasonByLeagueIdUsecase extends Usecase<List<Season>, GetAllSeasonByLeagueIdParams> {
  final SeasonRepository _seasonRepository;

  GetAllSeasonByLeagueIdUsecase() : _seasonRepository = GetIt.I.get<SeasonRepository>();

  @override
  Future<List<Season>> execute(GetAllSeasonByLeagueIdParams params) async {
    return await _seasonRepository.getAllSeasonsByLeagueId(params.leagueId);
  }
}

class GetAllSeasonByLeagueIdParams {
  final int leagueId;

  GetAllSeasonByLeagueIdParams({required this.leagueId});
}

