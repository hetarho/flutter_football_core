import 'dart:math';

import 'package:flutter_football_core/constant/create_game_data.dart';
import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/club/create_club.uc.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:flutter_football_core/use-cases/interfaces/random_manager.util.interface.dart';
import 'package:flutter_football_core/use-cases/league/create_league.uc.dart';
import 'package:flutter_football_core/use-cases/player/create_player.uc.dart';
import 'package:flutter_football_core/use-cases/season/create_season.uc.dart';
import 'package:get_it/get_it.dart';

class CreateGameSlotUsecase extends Usecase<int, CreateGameSlotParams> {
  final GameSlotRepository _gameSlotRepository;
  final RandomManager _randomManager;
  final CreateClubUsecase _createClubUsecase;
  final CreatePlayerUsecase _createPlayerUsecase;
  final CreateLeagueUsecase _createLeagueUsecase;
  final CreateSeasonUsecase _createSeasonUsecase;

  CreateGameSlotUsecase()
      : _gameSlotRepository = GetIt.I.get<GameSlotRepository>(),
        _createClubUsecase = GetIt.I.get<CreateClubUsecase>(),
        _createPlayerUsecase = GetIt.I.get<CreatePlayerUsecase>(),
        _createLeagueUsecase = GetIt.I.get<CreateLeagueUsecase>(),
        _createSeasonUsecase = GetIt.I.get<CreateSeasonUsecase>(),
        _randomManager = GetIt.I.get<RandomManager>();

  @override
  Future<int> execute(CreateGameSlotParams params) async {
    int gameSlotId = await _gameSlotRepository.createGameSlot(saveName: params.saveName);
    GameSlot gameSlot = await _gameSlotRepository.getGameSlot(gameSlotId);

    await Future.forEach(leagueSeedData, (league) async {
      final leagueId = await _createLeagueUsecase.execute(CreateLeagueParams(
        name: league['name'] as String,
        gameSlotId: gameSlotId,
        country: league['country'] as Country,
        tier: league['tier'] as int,
      ));

      await _createSeasonUsecase.execute(CreateSeasonParams(
        leagueId: leagueId,
        gameSlotId: gameSlotId,
        startDate: gameSlot.createAt,
        endDate: gameSlot.createAt.add(Duration(days: 365)),
      ));

      await Future.forEach(clubSeedData[league['name'] as String] ?? [], (club) async {
        int clubId = await _createClubUsecase.execute(CreateClubParams(name: club['name'] as String, gameSlotId: gameSlotId, leagueId: leagueId));

        //최소 11명 생성
        await Future.forEach(List.generate(11, (i) => i), (index) async {
          Country randomCountry = RandomCountry.random();
          await _createPlayerUsecase.execute(CreatePlayerParams(
            name: _randomManager.generateRandomName(country: randomCountry),
            clubId: clubId,
            gameSlotId: gameSlotId,
            position: switch (index % 3) {
              0 => Position.forward,
              1 => Position.midfield,
              2 => Position.defense,
              _ => Position.goalie,
            },
            age: Random().nextInt(18) + 16,
            stat: Random().nextInt(100) + 20 * (league['tier'] as int),
            backNumber: index + 1,
            isStarting: true,
            country: randomCountry,
          ));
        });

        //추가 플레이어 생성
        int additionalPlayerCount = 3 + Random().nextInt(10);
        await Future.forEach(List.generate(additionalPlayerCount, (i) => i), (index) async {
          Country randomCountry = RandomCountry.random();
          await _createPlayerUsecase.execute(CreatePlayerParams(
            name: _randomManager.generateRandomName(country: randomCountry),
            clubId: clubId,
            gameSlotId: gameSlotId,
            position: switch (Random().nextInt(4)) {
              0 => Position.forward,
              1 => Position.midfield,
              2 => Position.defense,
              _ => Position.goalie,
            },
            age: Random().nextInt(18) + 16,
            stat: Random().nextInt(80) + 20 * (league['tier'] as int),
            country: randomCountry,
          ));
        });
      });
    });

    int freePlayerCount = 10 + Random().nextInt(20);
    await Future.forEach(List.generate(freePlayerCount, (i) => i), (index) async {
      Country randomCountry = RandomCountry.random();
      await _createPlayerUsecase.execute(CreatePlayerParams(
        name: _randomManager.generateRandomName(country: randomCountry),
        gameSlotId: gameSlotId,
        position: switch (Random().nextInt(4)) {
          0 => Position.forward,
          1 => Position.midfield,
          2 => Position.defense,
          _ => Position.goalie,
        },
        age: Random().nextInt(18) + 16,
        stat: Random().nextInt(70) + 20,
        country: randomCountry,
      ));
    });

    return gameSlotId;
  }
}

class CreateGameSlotParams {
  final String saveName;

  CreateGameSlotParams({required this.saveName});
}
