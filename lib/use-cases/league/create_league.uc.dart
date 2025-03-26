import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/league.repository.interface.dart';
import 'package:get_it/get_it.dart';

class CreateLeagueUsecase extends Usecase<int, CreateLeagueParams> {
  final LeagueRepository _leagueRepository;

  CreateLeagueUsecase() : _leagueRepository = GetIt.I.get<LeagueRepository>();

  @override
  Future<int> execute(CreateLeagueParams params) async {
    return await _leagueRepository.createLeague(name: params.name, gameSlotId: params.gameSlotId, country: params.country, tier: params.tier);
  }
}

class CreateLeagueParams {
  final String name;
  final int gameSlotId;
  final Country country;
  final int tier;

  CreateLeagueParams({required this.name, required this.gameSlotId, required this.country, required this.tier});
}
