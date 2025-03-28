import 'package:flutter/material.dart';
import 'package:flutter_football_core/entities/club/club.dart';
import 'package:flutter_football_core/entities/player/player.dart';
import 'package:flutter_football_core/presentation/providers/club.provider.dart';
import 'package:flutter_football_core/presentation/providers/user.provider.dart';
import 'package:flutter_football_core/presentation/screens/home/home.screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});
  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerAsync = ref.watch(playerProvider);
    final clubAsync = ref.watch(clubProvider);

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
      body: playerAsync.when(
        data: (players) => ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            Player player = players[index];
            Club? club;
            if (player.clubId != null) {
              club = clubAsync.when(
                data: (clubs) => clubs.firstWhere((club) => club.id == players[index].clubId),
                error: (error, stack) => null,
                loading: () => null,
              );
            }
            return Row(
              children: [
                Text(player.name),
                Gap(10),
                Text(club?.name ?? 'FREE'),
                Gap(10),
                Text(player.position.name),
                Gap(10),
                Text(player.age.toString()),
                Gap(10),
                Text(player.stat.toString()),
                Gap(10),
                if (player.isStarting == true)
                  Icon(Icons.check)
              ],
            );
          },
        ),
        error: (error, stack) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
