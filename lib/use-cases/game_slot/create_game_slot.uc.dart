import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:get_it/get_it.dart';

class CreateGameSlotUsecase extends Usecase<int, CreateGameSlotParams> {
  final GameSlotRepository _gameSlotRepository;

  CreateGameSlotUsecase() : _gameSlotRepository = GetIt.I.get<GameSlotRepository>();

  @override
  Future<int> execute(CreateGameSlotParams params) async {
    return await _gameSlotRepository.createGameSlot(saveName: params.saveName);
  }
}

class CreateGameSlotParams {
  final String saveName;

  CreateGameSlotParams({required this.saveName});
}
