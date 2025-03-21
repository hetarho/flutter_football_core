import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:flutter_football_core/use-cases/interfaces/player.repository.interface.dart';
import 'package:get_it/get_it.dart';

class DeleteGameSlotUsecase extends Usecase<void, DeleteGameSlotParams> {
  final GameSlotRepository _gameSlotRepository;
  final ClubRepository _clubRepository;
  final PlayerRepository _playerRepository;

  DeleteGameSlotUsecase()
      : _gameSlotRepository = GetIt.I.get<GameSlotRepository>(),
        _clubRepository = GetIt.I.get<ClubRepository>(),
        _playerRepository = GetIt.I.get<PlayerRepository>();

  @override
  Future<void> execute(DeleteGameSlotParams params) async {
    await _gameSlotRepository.deleteGameSlot(params.id);
    await _clubRepository.deleteClubByGameSlotId(params.id);
    await _playerRepository.deletePlayerByGameSlotId(params.id);
  }
}

class DeleteGameSlotParams {
  final int id;

  DeleteGameSlotParams({required this.id});
}
