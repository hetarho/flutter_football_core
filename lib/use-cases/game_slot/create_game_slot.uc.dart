import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/club/create_club.uc.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:flutter_football_core/use-cases/league/create_league.uc.dart';
import 'package:flutter_football_core/use-cases/player/create_player.uc.dart';
import 'package:flutter_football_core/use-cases/season/create_season.uc.dart';
import 'package:get_it/get_it.dart';

class CreateGameSlotUsecase extends Usecase<int, CreateGameSlotParams> {
  final GameSlotRepository _gameSlotRepository;
  final CreateClubUsecase _createClubUsecase;
  final CreatePlayerUsecase _createPlayerUsecase;
  final CreateLeagueUsecase _createLeagueUsecase;
  final CreateSeasonUsecase _createSeasonUsecase;

  CreateGameSlotUsecase()
      : _gameSlotRepository = GetIt.I.get<GameSlotRepository>(),
        _createClubUsecase = GetIt.I.get<CreateClubUsecase>(),
        _createPlayerUsecase = GetIt.I.get<CreatePlayerUsecase>(),
        _createLeagueUsecase = GetIt.I.get<CreateLeagueUsecase>(),
        _createSeasonUsecase = GetIt.I.get<CreateSeasonUsecase>();

  @override
  Future<int> execute(CreateGameSlotParams params) async {
    int gameSlotId = await _gameSlotRepository.createGameSlot(saveName: params.saveName);
    GameSlot gameSlot = await _gameSlotRepository.getGameSlot(gameSlotId);

    await Future.forEach(List.generate(4, (i) => i), (index) async {
      final leagueId = await _createLeagueUsecase.execute(CreateLeagueParams(
        name: '리그${index + 1}',
        gameSlotId: gameSlotId,
        country: Country.england,
        tier: index + 1,
      ));

      await _createSeasonUsecase.execute(CreateSeasonParams(
        leagueId: leagueId,
        gameSlotId: gameSlotId,
        startDate: gameSlot.createAt,
        endDate: gameSlot.createAt.add(Duration(days: 365)),
      ));

      await Future.forEach(List.generate(20, (i) => i), (index) async {
        int clubId = await _createClubUsecase.execute(CreateClubParams(name: '팀${index + 1}', gameSlotId: gameSlotId, leagueId: leagueId));
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
    });

    return gameSlotId;
  }
}

class CreateGameSlotParams {
  final String saveName;

  CreateGameSlotParams({required this.saveName});
}
