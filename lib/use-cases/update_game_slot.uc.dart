import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:get_it/get_it.dart';

class UpdateGameSlotUsecase extends Usecase<void, UpdateGameSlotParams> {
  final GameSlotRepository _gameSlotRepository;

  UpdateGameSlotUsecase() : _gameSlotRepository = GetIt.I.get<GameSlotRepository>();

  @override
  Future<void> execute(UpdateGameSlotParams params) async {
    await _gameSlotRepository.updateGameSlot(params.gameSlot);
  }
}

class UpdateGameSlotParams {
  final GameSlot gameSlot;

  UpdateGameSlotParams({required this.gameSlot});
}
