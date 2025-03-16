import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';

class DeleteGameSlotUsecase extends Usecase<void, DeleteGameSlotParams> {
  final GameSlotRepository gameSlotRepository;

  DeleteGameSlotUsecase({required this.gameSlotRepository});

  @override
  Future<void> execute(DeleteGameSlotParams params) async {
    await gameSlotRepository.deleteGameSlot(params.id);
  }
}

class DeleteGameSlotParams {
  final int id;

  DeleteGameSlotParams({required this.id});
}
