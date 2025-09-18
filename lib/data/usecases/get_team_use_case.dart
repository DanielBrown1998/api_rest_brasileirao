import 'package:api_rest_brasileirao/domain/entities/team.dart';
import 'package:api_rest_brasileirao/domain/repository/team_repository_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_team_use_case_abstract.dart';

class GetTeamUseCase implements GetTeamUseCaseAbstract {
  final TeamRepositoryAbstract repository;

  GetTeamUseCase(this.repository);

  @override
  Future<Team?> call(String link) async {
    return await repository.getTeam(link);
  }
}
