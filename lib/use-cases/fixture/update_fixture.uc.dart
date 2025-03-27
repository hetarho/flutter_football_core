import 'package:flutter_football_core/entities/fixture/fixture.dart';
import 'package:flutter_football_core/use-cases/interfaces/fixture.repository.interface.dart';
import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:get_it/get_it.dart';

class UpdateFixtureUsecase extends Usecase<void, UpdateFixtureParams> {
  final FixtureRepository _fixtureRepository;

  UpdateFixtureUsecase() : _fixtureRepository = GetIt.I.get<FixtureRepository>();

  @override
  Future<void> execute(UpdateFixtureParams params) async {
    await _fixtureRepository.updateFixture(id: params.fixture.id, homeScore: params.fixture.homeScore, awayScore: params.fixture.awayScore);
  }
}

class UpdateFixtureParams {
  final Fixture fixture;

  UpdateFixtureParams({required this.fixture});
}
