class GameSlot {
  final int id;
  final String saveName;
  final DateTime createAt;
  final DateTime updateAt;

  GameSlot({
    required this.id,
    required this.saveName,
    required this.createAt,
    required this.updateAt,
  });

  GameSlot copyWith({
    String? saveName,
    DateTime? createAt,
    DateTime? updateAt,
  }) {
    return GameSlot(
      id: id,
      saveName: saveName ?? this.saveName,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }
}
