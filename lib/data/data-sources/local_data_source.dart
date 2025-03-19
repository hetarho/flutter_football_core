import 'package:flutter_football_core/adapters/game_slot.adapter.dart';
import 'package:flutter_football_core/data/data-sources/interfaces/local_storage.interface.dart';
import 'package:flutter_football_core/data/model/game_slot.model.dart';
import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:get_it/get_it.dart';

class LocalDataSource implements DataSource {
  static final instanceName = 'localDataSource';
  late final LocalStorage _localStorage;
  final GameSlotAdapter _gameSlotAdapter = GameSlotAdapter();

  LocalDataSource() : _localStorage = GetIt.I.get<LocalStorage>();

  @override
  Future<int> createGameSlot({required String saveName}) async {
    final id = await _localStorage.getNextId('game_slot');
    final gameSlotModel = GameSlotModel(
      id: id,
      saveName: saveName,
      createAt: DateTime.now(),
      updateAt: DateTime.now(),
    );

    return await _localStorage.create<GameSlotModel>(key: 'game_slot', id: id, value: gameSlotModel);
  }

  @override
  Future<void> deleteGameSlot(int id) async {
    await _localStorage.delete(key: 'game_slot', id: id);
  }

  @override
  Future<List<GameSlot>> getAllGameSlots() async {
    final List<GameSlotModel> models = await _localStorage.readAll(key: 'game_slot');
    // 모델 리스트를 엔티티 리스트로 변환
    return models.map((model) => _gameSlotAdapter.toEntity(model)).toList();
  }

  @override
  Future<GameSlot> getGameSlot(int id) async {
    final GameSlotModel model = await _localStorage.read(key: 'game_slot', id: id);
    // 모델을 엔티티로 변환
    return _gameSlotAdapter.toEntity(model);
  }

  @override
  Future<void> updateGameSlot({
    required int id,
    String? saveName,
  }) async {
    final gameSlotModel = await _localStorage.read<GameSlotModel>(key: 'game_slot', id: id);
    final updatedGameSlotModel = gameSlotModel.copyWith(saveName: saveName, updateAt: DateTime.now());
    await _localStorage.update(key: 'game_slot', id: id, value: updatedGameSlotModel);
  }
}
