import 'package:flutter/material.dart';
import 'package:flutter_football_core/presentation/providers/game_slot.provider.dart';
import 'package:flutter_football_core/presentation/screens/create_game_slot/select_club.screen.dart';
import 'package:flutter_football_core/use-cases/game_slot/create_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/get_game_slot.uc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class CreateGameSlotScreen extends ConsumerWidget {
  CreateGameSlotScreen({super.key});
  static const String routeName = '/create-game-slot';

  final TextEditingController _nameController = TextEditingController();

  createGameSlot(WidgetRef ref) async {
    final id = await GetIt.I.get<CreateGameSlotUsecase>().execute(CreateGameSlotParams(saveName: _nameController.text));
    final gameSlot = await GetIt.I.get<GetGameSlotUsecase>().execute(GetGameSlotParams(id: id));
    ref.read(selectedGameSlotProvider.notifier).state = gameSlot;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Set Game Slot Name'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _nameController,
              ),
            ),
            const Gap(16),
            ElevatedButton(
              onPressed: () async {
                await createGameSlot(ref);

                if (context.mounted) context.go(SelectClubScreen.routeName);
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
