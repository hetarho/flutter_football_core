import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:get_it/get_it.dart';

class UpdateGameSlotUsecase extends Usecase<void, UpdateGameSlotParams> {
  final GameSlotRepository _gameSlotRepository;

  UpdateGameSlotUsecase() : _gameSlotRepository = GetIt.I.get<GameSlotRepository>();

  @override
  Future<void> execute(UpdateGameSlotParams params) async {
    await _gameSlotRepository.updateGameSlot(id: params.id, saveName: params.saveName);
  }
}

class UpdateGameSlotParams {
  final int id;
  final String? saveName;

  UpdateGameSlotParams({required this.id, this.saveName});
}
