import 'package:flutter_football_core/adapters/club.adapter.dart';
import 'package:flutter_football_core/adapters/fixture.adapter.dart';
import 'package:flutter_football_core/adapters/game_slot.adapter.dart';
import 'package:flutter_football_core/adapters/league.adapter.dart';
import 'package:flutter_football_core/adapters/player.adapter.dart';
import 'package:flutter_football_core/adapters/season.adapter.dart';
import 'package:flutter_football_core/data/data-sources/interfaces/local_storage.interface.dart';
import 'package:flutter_football_core/data/model/club.model.dart';
import 'package:flutter_football_core/data/model/fixture.model.dart';
import 'package:flutter_football_core/data/model/game_slot.model.dart';
import 'package:flutter_football_core/data/model/league.model.dart';
import 'package:flutter_football_core/data/model/player.model.dart';
import 'package:flutter_football_core/data/model/season.model.dart';
import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/entities/fixture/fixture.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/entities/league/league.dart';
import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/entities/season/season.dart';
import 'package:get_it/get_it.dart';

class LocalDataSource implements DataSource {
  static final instanceName = 'localDataSource';
  late final LocalStorage _localStorage;
  final GameSlotAdapter _gameSlotAdapter = GameSlotAdapter();
  final ClubAdapter _clubAdapter = ClubAdapter();
  final PlayerAdapter _playerAdapter = PlayerAdapter();
  final LeagueAdapter _leagueAdapter = LeagueAdapter();
  final SeasonAdapter _seasonAdapter = SeasonAdapter();
  final FixtureAdapter _fixtureAdapter = FixtureAdapter();

  LocalDataSource() : _localStorage = GetIt.I.get<LocalStorage>();

  @override
  Future<int> createGameSlot({required String saveName}) async {
    final id = await _localStorage.getNextId(GameSlotModel.boxName);
    final gameSlotModel = GameSlotModel(
      id: id,
      saveName: saveName,
      createAt: DateTime.now(),
      updateAt: DateTime.now(),
    );

    return await _localStorage.create<GameSlotModel>(key: GameSlotModel.boxName, id: id, value: gameSlotModel);
  }

  @override
  Future<void> deleteGameSlot(int id) async {
    await _localStorage.delete(key: GameSlotModel.boxName, id: id);
  }

  @override
  Future<List<GameSlot>> getAllGameSlots() async {
    final List<GameSlotModel> models = await _localStorage.readAll(key: GameSlotModel.boxName);
    // 모델 리스트를 엔티티 리스트로 변환
    return models.map((model) => _gameSlotAdapter.toEntity(model)).toList();
  }

  @override
  Future<GameSlot> getGameSlot(int id) async {
    final GameSlotModel model = await _localStorage.read(key: GameSlotModel.boxName, id: id);
    // 모델을 엔티티로 변환
    return _gameSlotAdapter.toEntity(model);
  }

  @override
  Future<void> updateGameSlot({
    required int id,
    String? saveName,
  }) async {
    final gameSlotModel = await _localStorage.read<GameSlotModel>(key: GameSlotModel.boxName, id: id);
    final updatedGameSlotModel = gameSlotModel.copyWith(saveName: saveName, updateAt: DateTime.now());
    await _localStorage.update(key: GameSlotModel.boxName, id: id, value: updatedGameSlotModel);
  }

  @override
  Future<int> createClub({required String name, required int gameSlotId, required int leagueId}) async {
    final id = await _localStorage.getNextId(ClubModel.boxName);
    final clubModel = ClubModel(id: id, name: name, gameSlotId: gameSlotId, leagueId: leagueId, win: 0, draw: 0, lose: 0, goal: 0, goalAgainst: 0);
    await _localStorage.create<ClubModel>(key: ClubModel.boxName, id: id, value: clubModel);
    return id;
  }

  @override
  Future<void> deleteClub(int id) async {
    await _localStorage.delete(key: ClubModel.boxName, id: id);
  }

  @override
  Future<List<Club>> getAllClubs() async {
    final List<ClubModel> models = await _localStorage.readAll(key: ClubModel.boxName);
    return models.map((model) => _clubAdapter.toEntity(model)).toList();
  }

  @override
  Future<Club> getClub(int id) async {
    final ClubModel model = await _localStorage.read(key: ClubModel.boxName, id: id);
    return _clubAdapter.toEntity(model);
  }

  @override
  Future<void> updateClub({
    required int id,
    String? name,
    int? win,
    int? draw,
    int? lose,
    int? goal,
    int? goalAgainst,
  }) async {
    final clubModel = await _localStorage.read<ClubModel>(key: ClubModel.boxName, id: id);
    final updatedClubModel = clubModel.copyWith(name: name, win: win, draw: draw, lose: lose, goal: goal, goalAgainst: goalAgainst);
    await _localStorage.update(key: ClubModel.boxName, id: id, value: updatedClubModel);
  }

  @override
  Future<List<Club>> getAllClubsByGameSlotId(int gameSlotId) async {
    final List<ClubModel> models = await _localStorage.readAll(key: ClubModel.boxName);
    return models.where((model) => model.gameSlotId == gameSlotId).map((model) => _clubAdapter.toEntity(model)).toList();
  }

  @override
  Future<List<Club>> getAllClubsByLeagueId(int leagueId) async {
    final List<ClubModel> models = await _localStorage.readAll(key: ClubModel.boxName);
    return models.where((model) => model.leagueId == leagueId).map((model) => _clubAdapter.toEntity(model)).toList();
  }

  @override
  Future<void> deleteClubByGameSlotId(int gameSlotId) async {
    final List<ClubModel> models = await _localStorage.readAll(key: ClubModel.boxName);
    for (final model in models) {
      if (model.gameSlotId == gameSlotId) {
        await _localStorage.delete(key: ClubModel.boxName, id: model.id);
      }
    }
  }

  @override
  Future<int> createPlayer({required String name, required Position position, required int age, required int stat, required int clubId, required int gameSlotId}) async {
    final id = await _localStorage.getNextId(PlayerModel.boxName);
    final player = Player(
      id: id,
      name: name,
      position: position,
      age: age,
      stat: stat,
      clubId: clubId,
      gameSlotId: gameSlotId,
    );
    await _localStorage.create<PlayerModel>(key: PlayerModel.boxName, id: id, value: _playerAdapter.toModel(player));
    return id;
  }

  @override
  Future<List<Player>> getAllPlayersByClubId(int clubId) async {
    final List<PlayerModel> models = await _localStorage.readAll(key: PlayerModel.boxName);
    return models.where((model) => model.clubId == clubId).map((model) => _playerAdapter.toEntity(model)).toList();
  }

  @override
  Future<void> deletePlayerByGameSlotId(int gameSlotId) async {
    final List<PlayerModel> models = await _localStorage.readAll(key: PlayerModel.boxName);
    for (final model in models) {
      if (model.gameSlotId == gameSlotId) {
        await _localStorage.delete(key: PlayerModel.boxName, id: model.id);
      }
    }
  }

  @override
  Future<int> createLeague({required String name, required int gameSlotId, required Country country, required int tier}) async {
    final id = await _localStorage.getNextId(LeagueModel.boxName);
    final league = League(id: id, name: name, gameSlotId: gameSlotId, country: country, tier: tier);
    await _localStorage.create<LeagueModel>(key: LeagueModel.boxName, id: id, value: _leagueAdapter.toModel(league));
    return id;
  }

  @override
  Future<void> deleteLeague(int id) async {
    await _localStorage.delete(key: LeagueModel.boxName, id: id);
  }

  @override
  Future<List<League>> getAllLeaguesByGameSlotId(int gameSlotId) async {
    final List<LeagueModel> models = await _localStorage.readAll(key: LeagueModel.boxName);
    return models.where((model) => model.gameSlotId == gameSlotId).map((model) => _leagueAdapter.toEntity(model)).toList();
  }

  @override
  Future<League> getLeague(int id) async {
    final LeagueModel model = await _localStorage.read(key: LeagueModel.boxName, id: id);
    return _leagueAdapter.toEntity(model);
  }

  @override
  Future<void> deleteLeagueByGameSlotId(int gameSlotId) async {
    final List<LeagueModel> models = await _localStorage.readAll(key: LeagueModel.boxName);
    for (final model in models) {
      if (model.gameSlotId == gameSlotId) {
        await _localStorage.delete(key: LeagueModel.boxName, id: model.id);
      }
    }
  }

  @override
  Future<int> createSeason({required int leagueId, required int gameSlotId, required DateTime startDate, required DateTime endDate}) async {
    final id = await _localStorage.getNextId(SeasonModel.boxName);
    final season = Season(id: id, leagueId: leagueId, gameSlotId: gameSlotId, startDate: startDate, endDate: endDate);
    await _localStorage.create<SeasonModel>(key: SeasonModel.boxName, id: id, value: _seasonAdapter.toModel(season));
    return id;
  }

  @override
  Future<List<Season>> getAllSeasonsByLeagueId(int leagueId) async {
    final List<SeasonModel> models = await _localStorage.readAll(key: SeasonModel.boxName);
    return models.where((model) => model.leagueId == leagueId).map((model) => _seasonAdapter.toEntity(model)).toList();
  }

  @override
  Future<int> createFixture({required int leagueId, required int gameSlotId, required int seasonId, required int homeClubId, required int awayClubId, required DateTime date}) async {
    final id = await _localStorage.getNextId(FixtureModel.boxName);
    final fixture = Fixture(
        id: id,
        leagueId: leagueId,
        gameSlotId: gameSlotId,
        seasonId: seasonId,
        homeClubId: homeClubId,
        awayClubId: awayClubId,
        date: date,
        homeScore: 0,
        awayScore: 0,
        homePossessionTime: Duration.zero,
        awayPossessionTime: Duration.zero);
    await _localStorage.create<FixtureModel>(key: FixtureModel.boxName, id: id, value: _fixtureAdapter.toModel(fixture));
    return id;
  }

  @override
  Future<List<Fixture>> getFixturesByLeagueId(int leagueId) async {
    final List<FixtureModel> models = await _localStorage.readAll(key: FixtureModel.boxName);
    return models.where((model) => model.leagueId == leagueId).map((model) => _fixtureAdapter.toEntity(model)).toList();
  }
}
