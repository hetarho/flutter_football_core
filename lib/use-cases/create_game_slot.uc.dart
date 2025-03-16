import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
class CreateGameSlotUsecase extends Usecase<int, CreateGameSlotParams> {
  final GameSlotRepository gameSlotRepository;

  CreateGameSlotUsecase({required this.gameSlotRepository});

  @override
  Future<int> execute(CreateGameSlotParams params) async {
    return gameSlotRepository.createGameSlot(params);
  }
}

class CreateGameSlotParams {
  final String saveName;

  CreateGameSlotParams({required this.saveName});
}
