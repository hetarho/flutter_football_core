import 'package:hive_ce_flutter/hive_flutter.dart';

part 'country.enum.g.dart';

@HiveType(typeId: 100)
enum HiveCountry {
  @HiveField(0)
  england,
  @HiveField(1)
  spain,
  @HiveField(2)
  italy,
  @HiveField(3)
  germany,
  @HiveField(4)
  france,
  @HiveField(5)
  portugal,
  @HiveField(6)
  argentina,
  @HiveField(7)
  brazil,
  @HiveField(8)
  colombia,
  @HiveField(9)
  chile,
  @HiveField(10)
  uruguay,
  @HiveField(11)
  japan,
  @HiveField(12)
  korea,
  @HiveField(13)
  china,
  @HiveField(14)
  india,
  @HiveField(15)
  australia,
  @HiveField(16)
  southAfrica,
  @HiveField(17)
  mexico,
  @HiveField(18)
  usa,
  @HiveField(19)
  canada,
}
