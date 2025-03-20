import 'package:flutter_football_core/use-cases/_usecase.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:get_it/get_it.dart';

class DeleteClubUsecase extends Usecase<void, DeleteClubParams> {
  final ClubRepository _clubRepository;

  DeleteClubUsecase() : _clubRepository = GetIt.I.get<ClubRepository>();

  @override
  Future<void> execute(DeleteClubParams params) async {
    await _clubRepository.deleteClub(params.id);
  }
}

class DeleteClubParams {
  final int id;

  DeleteClubParams({required this.id});
}
