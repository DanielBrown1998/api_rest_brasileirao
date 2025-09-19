import 'package:api_rest_brasileirao/data/repository/championship_repository.dart';
import 'package:api_rest_brasileirao/data/repository/team_repository.dart';
import 'package:api_rest_brasileirao/data/workflow/api/api_championship.dart';
import 'package:api_rest_brasileirao/data/workflow/api/api_teams.dart';
import 'package:api_rest_brasileirao/data/usecases/get_all_championships_use_case.dart';
import 'package:api_rest_brasileirao/data/usecases/get_championship_use_case.dart';
import 'package:api_rest_brasileirao/data/usecases/get_next_matches_use_case.dart';
import 'package:api_rest_brasileirao/data/usecases/get_table_field_use_case.dart';
import 'package:api_rest_brasileirao/data/usecases/get_team_use_case.dart';
import 'package:api_rest_brasileirao/domain/repository/championship_repository_abstract.dart';
import 'package:api_rest_brasileirao/domain/repository/team_repository_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_all_championships_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_championship_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_next_matches_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_table_field_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_team_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/workflow/championship_workflow.dart';
import 'package:api_rest_brasileirao/domain/workflow/teams_workflow.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  ApiChampionship apiChampionship = ApiChampionship();
  ApiTeams apiTeams = ApiTeams();

  getIt.registerLazySingleton<ChampionshipWorkflow>(() => apiChampionship);
  getIt.registerLazySingleton<TeamsWorkflow>(() => apiTeams);

  getIt.registerLazySingleton<TeamRepositoryAbstract>(
    () => TeamRepository(getIt.get<TeamsWorkflow>()),
  );

  getIt.registerLazySingleton<ChampionshipRepositoryAbstract>(
    () => ChampionshipRepository(getIt.get<ChampionshipWorkflow>()),
  );

  getIt.registerFactory<GetTeamUseCaseAbstract>(() {
    return GetTeamUseCase(getIt.get<TeamRepositoryAbstract>());
  });

  getIt.registerFactory<GetNextMatchesUseCaseAbstract>(
    () => GetNextMatchesUseCase(getIt.get<TeamRepositoryAbstract>()),
  );

  getIt.registerFactory<GetChampionshipUseCaseAbstract>(() {
    return GetChampionshipUseCase(getIt.get<ChampionshipRepositoryAbstract>());
  });
  getIt.registerFactory<GetTableFieldUseCaseAbstract>(() {
    return GetTableFieldUseCase(getIt.get<ChampionshipRepositoryAbstract>());
  });
  getIt.registerFactory<GetAllChampionshipsUseCaseAbstract>(() {
    return GetAllChampionshipsUseCase(
      getIt.get<ChampionshipRepositoryAbstract>(),
    );
  });
}
