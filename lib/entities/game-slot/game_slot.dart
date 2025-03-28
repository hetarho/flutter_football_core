class GameSlot {
  final int id;
  final String saveName;
  final DateTime createAt;
  final DateTime updateAt;
  final DateTime? inGameTime;
  final int? selectedClubId;

  GameSlot({
    required this.id,
    required this.saveName,
    required this.createAt,
    required this.updateAt,
    this.inGameTime,
    this.selectedClubId,
  });

  @override
  String toString() {
    return 'GameSlot(id: $id, saveName: $saveName, createAt: $createAt, updateAt: $updateAt, inGameTime: $inGameTime, selectedClubId: $selectedClubId)';
  }
}
