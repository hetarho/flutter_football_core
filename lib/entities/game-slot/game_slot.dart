class GameSlot {
  final int id;
  final String saveName;
  final DateTime createAt;
  final DateTime updateAt;
  final int? selectedClubId;

  GameSlot({
    required this.id,
    required this.saveName,
    required this.createAt,
    required this.updateAt,
    this.selectedClubId,
  });

  @override
  String toString() {
    return 'GameSlot(id: $id, saveName: $saveName, createAt: $createAt, updateAt: $updateAt, selectedClubId: $selectedClubId)';
  }
}
