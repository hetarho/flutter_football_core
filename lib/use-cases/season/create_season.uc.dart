import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/season.repository.interface.dart';
import 'package:get_it/get_it.dart';

class CreateSeasonUsecase extends Usecase<int, CreateSeasonParams> {
  final SeasonRepository _seasonRepository;

  CreateSeasonUsecase() : _seasonRepository = GetIt.I.get<SeasonRepository>();

  Future<int> execute(CreateSeasonParams params) async {
    return await _seasonRepository.createSeason(
      leagueId: params.leagueId,
      gameSlotId: params.gameSlotId,
      startDate: params.startDate,
      endDate: params.endDate,
    );
  }
}

class CreateSeasonParams {
  final int leagueId;
  final int gameSlotId;
  final DateTime startDate;
  final DateTime endDate;

  CreateSeasonParams({required this.leagueId, required this.gameSlotId, required this.startDate, required this.endDate});
}
