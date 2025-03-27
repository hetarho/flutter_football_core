import 'package:flutter/material.dart';
import 'package:flutter_football_core/presentation/providers/game_slot.provider.dart';
import 'package:flutter_football_core/presentation/screens/home/home.screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});
  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameSlot = ref.watch(selectedGameSlotProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () => context.pushReplacement(HomeScreen.routeName),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: Center(
        child: Text(gameSlot.saveName),
      ),
    );
  }
}
