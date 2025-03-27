import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/presentation/providers/game_slot.provider.dart';
import 'package:flutter_football_core/use-cases/club/get_all_club_by_game_slot_id.uc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clubProvider = FutureProvider.autoDispose<List<Club>>((ref) async {
  final gameSlot = ref.watch(selectedGameSlotProvider);

  final clubs = await GetAllClubByGameSlotIdUsecase().execute(GetAllClubByGameSlotIdParams(gameSlotId: gameSlot.id));
  return clubs;
});
