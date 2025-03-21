import 'package:flutter_football_core/adapters/_adapter.dart';
import 'package:flutter_football_core/data/model/club.model.dart';
import 'package:flutter_football_core/entities/club/club.dart';

class ClubAdapter implements EntityModelAdapter<Club, ClubModel> {
  @override
  Club toEntity(ClubModel model) {
    return Club(
      id: model.id,
      name: model.name,
      gameSlotId: model.gameSlotId,
      win: model.win,
      draw: model.draw,
      lose: model.lose,
      goal: model.goal,
      goalAgainst: model.goalAgainst,
    );
  }

  @override
  ClubModel toModel(Club entity) {
    return ClubModel(
      id: entity.id,
      name: entity.name,
      gameSlotId: entity.gameSlotId,
      win: entity.win,
      draw: entity.draw,
      lose: entity.lose,
      goal: entity.goal,
      goalAgainst: entity.goalAgainst,
    );
  }
}
