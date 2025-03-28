part of '../select_club.screen.dart';

class _ClubCard extends ConsumerWidget {
  _ClubCard({required this.club, required this.selectedClubId, required this.onPressed});

  final Club club;
  final int? selectedClubId;
  final void Function(int) onPressed;

  final updateGameSlotUsecase = GetIt.I.get<UpdateGameSlotUsecase>();
  final getGameSlotUsecase = GetIt.I.get<GetGameSlotUsecase>();

  Color getBgColor(int tier) {
    switch (tier) {
      case 1:
        return Colors.red[300]!;
      case 2:
        return Colors.blue[300]!;
      case 3:
        return Colors.green[300]!;
      default:
        return Colors.grey[300]!;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leagueAsync = ref.watch(leagueProvider);
    final color = getBgColor(leagueAsync.value
            ?.firstWhere(
              (element) => element.id == club.leagueId,
              orElse: () => League(
                id: 0,
                name: '',
                gameSlotId: 0,
                country: Country.canada,
                tier: 0,
              ),
            )
            .tier ??
        0);

    return GestureDetector(
      onTap: () => onPressed(club.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: color.withAlpha(100),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selectedClubId == club.id ? color : Colors.transparent,
            width: 3,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(leagueAsync.value?.firstWhere((element) => element.id == club.leagueId).name ?? ''),
            Text(club.name),
            SelectButton(
              onPressed: () async {
                await updateGameSlotUsecase.execute(UpdateGameSlotParams(
                  id: ref.read(selectedGameSlotProvider).id,
                  selectedClubId: club.id,
                ));
                final gameSlot = await getGameSlotUsecase.execute(GetGameSlotParams(id: ref.read(selectedGameSlotProvider).id));
                ref.read(selectedGameSlotProvider.notifier).state = gameSlot;
                if (context.mounted) {
                  context.pushReplacement(DashboardScreen.routeName);
                }
              },
              disabled: selectedClubId != club.id,
            ),
          ],
        ),
      ),
    );
  }
}
