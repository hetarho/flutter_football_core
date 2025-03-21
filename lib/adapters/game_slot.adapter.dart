import 'package:flutter_football_core/adapters/_adapter.dart';
import 'package:flutter_football_core/data/model/game_slot.model.dart';
import 'package:flutter_football_core/entities/game-slot/game_slot.dart';

/// GameSlot 엔티티와 GameSlotModel 모델 간의 변환을 담당하는 어댑터
class GameSlotAdapter implements EntityModelAdapter<GameSlot, GameSlotModel> {
  @override
  GameSlot toEntity(GameSlotModel model) {
    return GameSlot(
      id: model.id,
      saveName: model.saveName,
      createAt: model.createAt,
      updateAt: model.updateAt,
    );
  }

  @override
  GameSlotModel toModel(GameSlot entity) {
    return GameSlotModel(
      id: entity.id,
      saveName: entity.saveName,
      createAt: entity.createAt,
      updateAt: entity.updateAt,
    );
  }
}