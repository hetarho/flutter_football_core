import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/interfaces/player.repository.interface.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:get_it/get_it.dart';

class UpdatePlayerUsecase extends Usecase<void, UpdatePlayerParams> {
  final PlayerRepository _playerRepository;

  UpdatePlayerUsecase() : _playerRepository = GetIt.I.get<PlayerRepository>();

  @override
  Future<void> execute(UpdatePlayerParams params) async {
    await _playerRepository.updatePlayer(
      id: params.player.id,
      position: params.player.position,
      age: params.player.age,
      stat: params.player.stat,
      clubId: params.player.clubId,
      backNumber: params.player.backNumber,
      isStarting: params.player.isStarting,
    );
  }
}

class UpdatePlayerParams {
  final Player player;

  UpdatePlayerParams({required this.player});
}
