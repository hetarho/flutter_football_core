import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/player.repository.interface.dart';
import 'package:get_it/get_it.dart';

class CreatePlayerUsecase extends Usecase<int, CreatePlayerParams> {
  final PlayerRepository _playerRepository;

  CreatePlayerUsecase() : _playerRepository = GetIt.I.get<PlayerRepository>();

  @override
  Future<int> execute(CreatePlayerParams params) async {
    return await _playerRepository.createPlayer(
      name: params.name,
      position: params.position,
      age: params.age,
      stat: params.stat,
      clubId: params.clubId,
      gameSlotId: params.gameSlotId,
      backNumber: params.backNumber,
      isStarting: params.isStarting,
    );
  }
}

class CreatePlayerParams {
  final String name;
  final Position position;
  final int age;
  final int stat;
  final int? clubId;
  final int gameSlotId;
  final int? backNumber;
  final bool? isStarting;

  CreatePlayerParams(
      {required this.name,
      required this.position,
      required this.age,
      required this.stat,
      this.clubId,
      required this.gameSlotId,
      this.backNumber,
      this.isStarting});
}
