import 'package:flutter_football_core/presentation/screens/create_game_slot/create_game_slot.screen.dart';
import 'package:flutter_football_core/presentation/screens/home/home.screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: CreateGameSlotScreen.routeName,
      builder: (context, state) => CreateGameSlotScreen(),
    ),
  ],
);
