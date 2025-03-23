import 'package:flutter_football_core/data/model/country.model.dart';
import 'package:flutter_football_core/data/model/league.model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:flutter_football_core/data/model/club.model.dart';
import 'package:flutter_football_core/data/model/game_slot.model.dart';
import 'package:flutter_football_core/data/model/player.model.dart';
part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<GameSlotModel>(),
  AdapterSpec<ClubModel>(),
  AdapterSpec<PlayerModel>(),
  AdapterSpec<HivePosition>(),
  AdapterSpec<LeagueModel>(),
  AdapterSpec<HiveLeagueCountry>(),
])
class HiveAdapters {}
