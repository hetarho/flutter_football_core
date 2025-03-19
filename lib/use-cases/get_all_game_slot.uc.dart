import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetAllGameSlotUsecase extends UsecaseNoParams<List<GameSlot>> {
  final GameSlotRepository _gameSlotRepository;

  GetAllGameSlotUsecase() : _gameSlotRepository = GetIt.I.get<GameSlotRepository>();

  @override
  Future<List<GameSlot>> execute() async {
    return await _gameSlotRepository.getAllGameSlots();
  }
}
