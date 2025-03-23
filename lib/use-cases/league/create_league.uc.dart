import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/use-cases/interfaces/league.repository.interface.dart';
import 'package:get_it/get_it.dart';

class CreateLeagueUsecase {
  final LeagueRepository _leagueRepository;

  CreateLeagueUsecase() : _leagueRepository = GetIt.I.get<LeagueRepository>();

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
