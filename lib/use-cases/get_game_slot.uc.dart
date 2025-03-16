import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';

class GetGameSlotUsecase extends Usecase<GameSlot, GetGameSlotParams> {
  final GameSlotRepository gameSlotRepository;

  GetGameSlotUsecase({required this.gameSlotRepository});

  @override
  Future<GameSlot> execute(GetGameSlotParams params) async {
    return await gameSlotRepository.getGameSlot(params.id);
  }
}

class GetGameSlotParams {
  final int id;

  GetGameSlotParams({required this.id});
}
