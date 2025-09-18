import 'package:api_rest_brasileirao/domain/entities/match.dart';
import 'package:api_rest_brasileirao/domain/repository/team_repository_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_next_matches_use_case_abstract.dart';

class GetNextMatchesUseCase implements GetNextMatchesUseCaseAbstract {
  final TeamRepositoryAbstract repository;

  GetNextMatchesUseCase(this.repository);

  @override
  Future<List<Matchs>?> call(String id) async {
    return await repository.getTeamNextGames(id);
  }
}
