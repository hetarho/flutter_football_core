import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:get_it/get_it.dart';
class DeleteGameSlotUsecase extends Usecase<void, DeleteGameSlotParams> {
  final GameSlotRepository _gameSlotRepository;

  DeleteGameSlotUsecase() : _gameSlotRepository = GetIt.I.get<GameSlotRepository>();

  @override
  Future<void> execute(DeleteGameSlotParams params) async {
    await _gameSlotRepository.deleteGameSlot(params.id);
  }
}

class DeleteGameSlotParams {
  final int id;

  DeleteGameSlotParams({required this.id});
}
