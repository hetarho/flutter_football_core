import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/entities/fixture/fixture.dart';
import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/use-cases/club/update_club.uc.dart';
import 'package:flutter_football_core/use-cases/fixture/update_fixture.uc.dart';
import 'package:flutter_football_core/use-cases/player/update_player.uc.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:get_it/get_it.dart';

class SaveGameUsecase extends Usecase<void, SaveGameParams> {
  final UpdateClubUsecase _updateClubUsecase;
  final UpdatePlayerUsecase _updatePlayerUsecase;
  final UpdateFixtureUsecase _updateFixtureUsecase;

  SaveGameUsecase()
      : _updateClubUsecase = GetIt.I.get<UpdateClubUsecase>(),
        _updatePlayerUsecase = GetIt.I.get<UpdatePlayerUsecase>(),
        _updateFixtureUsecase = GetIt.I.get<UpdateFixtureUsecase>();

  @override
  Future<void> execute(SaveGameParams params) async {
    for (final club in params.clubs) {
      await _updateClubUsecase.execute(UpdateClubParams(club: club));
    }
    for (final player in params.players) {
      await _updatePlayerUsecase.execute(UpdatePlayerParams(player: player));
    }
    for (final fixture in params.fixtures) {
      await _updateFixtureUsecase.execute(UpdateFixtureParams(fixture: fixture));
    }
  }
}

class SaveGameParams {
  final List<Club> clubs;
  final List<Player> players;
  final List<Fixture> fixtures;

  SaveGameParams({required this.clubs, required this.players, required this.fixtures});
}
