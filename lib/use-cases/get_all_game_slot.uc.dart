import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';

class GetAllGameSlotUsecase extends UsecaseNoParams<List<GameSlot>> {
  final GameSlotRepository gameSlotRepository;

  GetAllGameSlotUsecase({required this.gameSlotRepository});

  @override
  Future<List<GameSlot>> execute() async {
    return await gameSlotRepository.getAllGameSlots();
  }
}
