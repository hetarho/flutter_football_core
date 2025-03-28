import 'package:flutter_football_core/entities/league/league.dart';
import 'package:flutter_football_core/presentation/providers/game_slot.provider.dart';
import 'package:flutter_football_core/use-cases/league/get_all_league_by_game_slot_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leagueProvider = FutureProvider<List<League>>((ref) async {
  final gameSlot = ref.watch(selectedGameSlotProvider);

  final league = await GetAllLeagueByGameSlotIdUsecase().execute(GetAllLeagueByGameSlotIdParams(gameSlotId: gameSlot.id));
  return league;
});
