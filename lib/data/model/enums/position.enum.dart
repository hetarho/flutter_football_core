import 'package:hive_ce_flutter/hive_flutter.dart';

part 'position.enum.g.dart';

@HiveType(typeId: 101)
enum HivePosition {
  @HiveField(0)
  forward,
  @HiveField(1)
  midfield,
  @HiveField(2)
  defense,
  @HiveField(3)
  goalie,
}
