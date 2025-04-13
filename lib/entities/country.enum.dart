import 'dart:math';

enum Country {
  england,
  spain,
  italy,
  germany,
  france,
  portugal,
  argentina,
  brazil,
  colombia,
  chile,
  uruguay,
  japan,
  korea,
  china,
  india,
  australia,
  southAfrica,
  mexico,
  usa,
  canada,
}

extension RandomCountry on Country {
  static final _random = Random();

  static Country random() {
    final values = Country.values;
    return values[_random.nextInt(values.length)];
  }
}
