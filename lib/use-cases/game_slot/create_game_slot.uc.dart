import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/club/create_club.uc.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:flutter_football_core/use-cases/player/create_player.uc.dart';
import 'package:get_it/get_it.dart';

class CreateGameSlotUsecase extends Usecase<int, CreateGameSlotParams> {
  final GameSlotRepository _gameSlotRepository;
  final CreateClubUsecase _createClubUsecase;
  final CreatePlayerUsecase _createPlayerUsecase;

  CreateGameSlotUsecase()
      : _gameSlotRepository = GetIt.I.get<GameSlotRepository>(),
        _createClubUsecase = GetIt.I.get<CreateClubUsecase>(),
        _createPlayerUsecase = GetIt.I.get<CreatePlayerUsecase>();

  @override
  Future<int> execute(CreateGameSlotParams params) async {
    int gameSlotId = await _gameSlotRepository.createGameSlot(saveName: params.saveName);

    await Future.forEach(List.generate(20, (i) => i), (index) async {
      int clubId = await _createClubUsecase.execute(CreateClubParams(name: '팀${index + 1}', gameSlotId: gameSlotId));
      await Future.forEach(List.generate(11, (i) => i), (index) async {
        await _createPlayerUsecase.execute(CreatePlayerParams(
            name: '플레이어${index + 1}',
            clubId: clubId,
            gameSlotId: gameSlotId,
            position: switch (index % 3) {
              0 => Position.forward,
              1 => Position.midfield,
              2 => Position.defense,
              _ => Position.goalie,
            },
            age: 20,
            stat: 100));
      });
    });

    return gameSlotId;
  }
}

class CreateGameSlotParams {
  final String saveName;

  CreateGameSlotParams({required this.saveName});
}
