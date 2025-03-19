import 'package:flutter_football_core/adapters/game_slot.adapter.dart';
import 'package:flutter_football_core/data/data-sources/interfaces/local_storage.interface.dart';
import 'package:flutter_football_core/data/model/game_slot.model.dart';
import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/create_game_slot.uc.dart';

class LocalDataSource extends DataSource {
  final LocalStorage localStorage;
  final GameSlotAdapter _gameSlotAdapter = GameSlotAdapter();

  LocalDataSource({required this.localStorage});

  @override
  Future<int> createGameSlot(CreateGameSlotParams params) async {
    final id = await localStorage.getNextId('game_slot');
    final gameSlotModel = GameSlotModel(
      id: id,
      saveName: params.saveName,
      createAt: DateTime.now(),
      updateAt: DateTime.now(),
    );

    return await localStorage.create<GameSlotModel>(key: 'game_slot', id: id, value: gameSlotModel);
  }

  @override
  Future<void> deleteGameSlot(int id) async {
    await localStorage.delete(key: 'game_slot', id: id);
  }

  @override
  Future<List<GameSlot>> getAllGameSlots() async {
    final List<GameSlotModel> models = await localStorage.readAll(key: 'game_slot');
    // 모델 리스트를 엔티티 리스트로 변환
    return models.map((model) => _gameSlotAdapter.toEntity(model)).toList();
  }

  @override
  Future<GameSlot> getGameSlot(int id) async {
    final GameSlotModel model = await localStorage.read(key: 'game_slot', id: id);
    // 모델을 엔티티로 변환
    return _gameSlotAdapter.toEntity(model);
  }

  @override
  Future<void> updateGameSlot(GameSlot gameSlot) async {
    // 엔티티를 모델로 변환
    final model = _gameSlotAdapter.toModel(gameSlot);
    await localStorage.update(key: 'game_slot', id: gameSlot.id, value: model);
  }
}
