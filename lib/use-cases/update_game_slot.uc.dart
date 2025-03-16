import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';

class UpdateGameSlotUsecase extends Usecase<void, UpdateGameSlotParams> {
  final GameSlotRepository gameSlotRepository;

  UpdateGameSlotUsecase({required this.gameSlotRepository});

  @override
  Future<void> execute(UpdateGameSlotParams params) async {
    await gameSlotRepository.updateGameSlot(params.gameSlot);
  }
}

class UpdateGameSlotParams {
  final GameSlot gameSlot;

  UpdateGameSlotParams({required this.gameSlot});
}
