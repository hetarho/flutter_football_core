import 'package:flutter/material.dart';
import 'package:flutter_football_core/presentation/screens/home/home.screen.dart';
import 'package:flutter_football_core/use-cases/game_slot/create_game_slot.uc.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class CreateGameSlotScreen extends StatelessWidget {
  CreateGameSlotScreen({super.key});
  static const String routeName = '/create-game-slot';

  final TextEditingController _nameController = TextEditingController();

  final CreateGameSlotUsecase _createGameSlotUsecase = GetIt.I.get<CreateGameSlotUsecase>();

  createGameSlot() async {
    await _createGameSlotUsecase.execute(CreateGameSlotParams(saveName: _nameController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Create Game Slot'),
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
                await createGameSlot();

                if (context.mounted) context.pushReplacement(HomeScreen.routeName);
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
