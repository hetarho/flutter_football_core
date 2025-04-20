import 'package:flutter/material.dart';
import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/entities/country.enum.dart';
import 'package:flutter_football_core/entities/league/league.dart';
import 'package:flutter_football_core/presentation/components/select_button.dart';
import 'package:flutter_football_core/presentation/providers/club.provider.dart';
import 'package:flutter_football_core/presentation/providers/game_slot.provider.dart';
import 'package:flutter_football_core/presentation/providers/league.provider.dart';
import 'package:flutter_football_core/presentation/screens/dashboard/dashboard.screen.dart';
import 'package:flutter_football_core/presentation/screens/home/home.screen.dart';
import 'package:flutter_football_core/use-cases/game_slot/get_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/update_game_slot.uc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

part 'components/club_card.dart';

class SelectClubScreen extends ConsumerStatefulWidget {
  const SelectClubScreen({super.key});
  static const String routeName = '/select-club';

  @override
  ConsumerState<SelectClubScreen> createState() => _SelectClubScreenState();
}

class _SelectClubScreenState extends ConsumerState<SelectClubScreen> {
  int? selectedClubId;

  @override
  Widget build(BuildContext context) {
    final clubsAsync = ref.watch(clubProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Club'),
        leading: IconButton(
          onPressed: () => context.go(HomeScreen.routeName),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Text(ref.watch(selectedGameSlotProvider).saveName),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: clubsAsync.when(
                data: (clubs) => ListView.builder(
                  itemCount: clubs.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      _ClubCard(
                        club: clubs[index],
                        selectedClubId: selectedClubId,
                        onPressed: (clubId) => setState(() => selectedClubId = clubId),
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
                error: (error, stack) => Text(error.toString()),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
