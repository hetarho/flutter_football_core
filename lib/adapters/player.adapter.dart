import 'package:flutter_football_core/adapters/_adapter.dart';
import 'package:flutter_football_core/data/model/player.model.dart';
import 'package:flutter_football_core/entities/player/player.dart';

class PositionAdapter {
  Position toEntity(HivePosition position) {
    return switch (position) {
      HivePosition.forward => Position.forward,
      HivePosition.midfield => Position.midfield,
      HivePosition.defense => Position.defense,
      HivePosition.goalie => Position.goalie,
    };
  }

  HivePosition toModel(Position position) {
    return switch (position) {
      Position.forward => HivePosition.forward,
      Position.midfield => HivePosition.midfield,
      Position.defense => HivePosition.defense,
      Position.goalie => HivePosition.goalie,
    };
  }
}

/// Player 엔티티와 PlayerModel 모델 간의 변환을 담당하는 어댑터
class PlayerAdapter implements EntityModelAdapter<Player, PlayerModel> {
  final PositionAdapter _positionAdapter;

  PlayerAdapter() : _positionAdapter = PositionAdapter();

  @override
  Player toEntity(PlayerModel model) {
    return Player(
      id: model.id,
      name: model.name,
      position: _positionAdapter.toEntity(model.position),
      age: model.age,
      stat: model.stat,
      clubId: model.clubId,
      gameSlotId: model.gameSlotId,
      isStarting: model.isStarting,
      backNumber: model.backNumber,
    );
  }

  @override
  PlayerModel toModel(Player entity) {
    return PlayerModel(
      id: entity.id,
      name: entity.name,
      position: _positionAdapter.toModel(entity.position),
      age: entity.age,
      stat: entity.stat,
      clubId: entity.clubId,
      gameSlotId: entity.gameSlotId,
      isStarting: entity.isStarting,
      backNumber: entity.backNumber,
    );
  }
}
