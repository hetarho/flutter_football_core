import 'package:flutter_football_core/entities/game-slot/game_slot.dart';
import 'package:flutter_football_core/use-cases/game_slot/get_game_slot.uc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedGameSlotProvider = StateProvider<GameSlot>((ref) => GameSlot(id: 0, saveName: '', createAt: DateTime.now(), updateAt: DateTime.now()));

final gameSlotProvider = FutureProvider.autoDispose<GameSlot>((ref) async {
  final gameSlot = await GetGameSlotUsecase().execute(GetGameSlotParams(id: ref.watch(selectedGameSlotProvider).id));
  return gameSlot;
});
