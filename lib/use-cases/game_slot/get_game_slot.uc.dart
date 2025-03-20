import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetGameSlotUsecase extends Usecase<GameSlot, GetGameSlotParams> {
  final GameSlotRepository _gameSlotRepository;

  GetGameSlotUsecase() : _gameSlotRepository = GetIt.I.get<GameSlotRepository>();

  @override
  Future<GameSlot> execute(GetGameSlotParams params) async {
    return await _gameSlotRepository.getGameSlot(params.id);
  }
}

class GetGameSlotParams {
  final int id;

  GetGameSlotParams({required this.id});
}
