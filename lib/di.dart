import 'package:flutter_football_core/data/data-sources/interfaces/local_storage.interface.dart';
import 'package:flutter_football_core/data/data-sources/local_data_source.dart';
import 'package:flutter_football_core/data/local-storage/hive/hive_local_storage.dart';
import 'package:flutter_football_core/data/repositories/club.repository.dart';
import 'package:flutter_football_core/data/repositories/game_slot.repository.dart';
import 'package:flutter_football_core/data/repositories/interface/data_source.interface.dart';
import 'package:flutter_football_core/use-cases/club/create_club.uc.dart';
import 'package:flutter_football_core/use-cases/club/get_all_club_by_game_slot_id.uc.dart';
import 'package:flutter_football_core/use-cases/club/get_club.uc.dart';
import 'package:flutter_football_core/use-cases/club/recode_fixture_result.uc.dart';
import 'package:flutter_football_core/use-cases/interfaces/club.repository.interface.dart';
import 'package:flutter_football_core/use-cases/interfaces/game_slot.repository.interface.dart';
import 'package:flutter_football_core/use-cases/game_slot/get_all_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/create_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/delete_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/get_game_slot.uc.dart';
import 'package:flutter_football_core/use-cases/game_slot/update_game_slot.uc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<LocalStorage>(() => HiveLocalStorage());
  locator.registerLazySingleton<DataSource>(() => LocalDataSource(), instanceName: LocalDataSource.instanceName);
  locator.registerLazySingleton<GameSlotRepository>(() => GameSlotRepositoryImpl(locator<DataSource>(instanceName: LocalDataSource.instanceName)));
  locator.registerLazySingleton<ClubRepository>(() => ClubRepositoryImpl(locator<DataSource>(instanceName: LocalDataSource.instanceName)));

  locator.registerLazySingleton<GetAllGameSlotUsecase>(() => GetAllGameSlotUsecase());
  locator.registerLazySingleton<CreateGameSlotUsecase>(() => CreateGameSlotUsecase());
  locator.registerLazySingleton<DeleteGameSlotUsecase>(() => DeleteGameSlotUsecase());
  locator.registerLazySingleton<GetGameSlotUsecase>(() => GetGameSlotUsecase());
  locator.registerLazySingleton<UpdateGameSlotUsecase>(() => UpdateGameSlotUsecase());

  locator.registerLazySingleton<CreateClubUsecase>(() => CreateClubUsecase());
  locator.registerLazySingleton<RecodeFixtureResultUsecase>(() => RecodeFixtureResultUsecase());
  locator.registerLazySingleton<GetClubUsecase>(() => GetClubUsecase());
  locator.registerLazySingleton<GetAllClubByGameSlotIdUsecase>(() => GetAllClubByGameSlotIdUsecase());
}
