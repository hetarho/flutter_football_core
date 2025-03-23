import 'package:flutter_football_core/adapters/_adapter.dart';
import 'package:flutter_football_core/data/model/season.model.dart';
import 'package:flutter_football_core/entities/season/season.dart';

class SeasonAdapter implements EntityModelAdapter<Season, SeasonModel> {
  @override
  Season toEntity(SeasonModel model) => Season(
        id: model.id,
        leagueId: model.leagueId,
        gameSlotId: model.gameSlotId,
        startDate: model.startDate,
        endDate: model.endDate,
      );

  @override
  SeasonModel toModel(Season entity) => SeasonModel(
        id: entity.id,
        leagueId: entity.leagueId,
        gameSlotId: entity.gameSlotId,
        startDate: entity.startDate,
        endDate: entity.endDate,
      );
}
