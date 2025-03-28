import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/presentation/providers/game_slot.provider.dart';
import 'package:flutter_football_core/use-cases/player/get_all_player_by_game_slot_id.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerProvider = FutureProvider<List<Player>>((ref) async {
  final gameSlot = ref.watch(selectedGameSlotProvider);

  final player = await GetAllPlayerByGameSlotIdUsecase().execute(GetAllPlayerByGameSlotIdParams(gameSlotId: gameSlot.id));
  return player;
});
