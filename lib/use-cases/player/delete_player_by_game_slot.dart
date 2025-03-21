import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/player.repository.interface.dart';
import 'package:get_it/get_it.dart';

class DeletePlayerByGameSlotUsecase extends Usecase<void, DeletePlayerByGameSlotParams> {
  final PlayerRepository _playerRepository;

  DeletePlayerByGameSlotUsecase()
      : _playerRepository = GetIt.I.get<PlayerRepository>();

  @override
  Future<void> execute(DeletePlayerByGameSlotParams params) async {
    await _playerRepository.deletePlayerByGameSlotId(params.id);
  }
}

class DeletePlayerByGameSlotParams {
  final int id;

  DeletePlayerByGameSlotParams({required this.id});
}
