import 'package:flutter_football_core/data/model/enums/country.enum.dart';
import 'package:flutter_football_core/data/model/enums/position.enum.dart';
import 'package:flutter_football_core/data/model/fixture.model.dart';
import 'package:flutter_football_core/data/model/league.model.dart';
import 'package:flutter_football_core/data/model/season.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:flutter_football_core/data/model/club.model.dart';
import 'package:flutter_football_core/data/model/game_slot.model.dart';
import 'package:flutter_football_core/data/model/player.model.dart';
part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<GameSlotModel>(),
  AdapterSpec<ClubModel>(),
  AdapterSpec<PlayerModel>(),
  AdapterSpec<LeagueModel>(),
  AdapterSpec<HiveCountry>(),
  AdapterSpec<HivePosition>(),
  AdapterSpec<SeasonModel>(),
  AdapterSpec<FixtureModel>(),
])
class HiveAdapters {}
