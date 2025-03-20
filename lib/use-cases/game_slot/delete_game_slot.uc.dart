import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:get_it/get_it.dart';

class DeleteGameSlotUsecase extends Usecase<void, DeleteGameSlotParams> {
  final GameSlotRepository _gameSlotRepository;
  final ClubRepository _clubRepository;

  DeleteGameSlotUsecase()
      : _gameSlotRepository = GetIt.I.get<GameSlotRepository>(),
        _clubRepository = GetIt.I.get<ClubRepository>();

  @override
  Future<void> execute(DeleteGameSlotParams params) async {
    await _gameSlotRepository.deleteGameSlot(params.id);
    await _clubRepository.deleteClubByGameSlotId(params.id);
  }
}

class DeleteGameSlotParams {
  final int id;

  DeleteGameSlotParams({required this.id});
}
