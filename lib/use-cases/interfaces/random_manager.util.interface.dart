import 'package:flutter_football_core/entities/country.enum.dart';

abstract class RandomManager {
  String generateRandomName({required Country country});
}
