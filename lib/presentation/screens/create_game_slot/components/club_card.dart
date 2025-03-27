part of '../select_club.screen.dart';

class _ClubCard extends ConsumerWidget {
  _ClubCard({required this.club, required this.selectedClubId, required this.onPressed});

  final Club club;
  final int? selectedClubId;
  final void Function(int) onPressed;

  final updateGameSlotUsecase = GetIt.I.get<UpdateGameSlotUsecase>();
  final getGameSlotUsecase = GetIt.I.get<GetGameSlotUsecase>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onPressed(club.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selectedClubId == club.id ? Colors.green : Colors.transparent,
            width: 3,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
