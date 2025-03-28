import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/player.repository.interface.dart';
import 'package:get_it/get_it.dart';

class GetAllPlayerByGameSlotIdUsecase extends Usecase<List<Player>, GetAllPlayerByGameSlotIdParams> {
  final PlayerRepository _playerRepository;

  GetAllPlayerByGameSlotIdUsecase() : _playerRepository = GetIt.I.get<PlayerRepository>();

  @override
  Future<List<Player>> execute(GetAllPlayerByGameSlotIdParams params) async {
    return await _playerRepository.getAllPlayersByGameSlotId(params.gameSlotId);
  }
}

class GetAllPlayerByGameSlotIdParams {
  final int gameSlotId;

  GetAllPlayerByGameSlotIdParams({required this.gameSlotId});
}
