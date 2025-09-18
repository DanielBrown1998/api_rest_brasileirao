import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/domain/repository/championship_repository_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_championship_use_case_abstract.dart';

class GetChampionshipUseCase implements GetChampionshipUseCaseAbstract {
  final ChampionshipRepositoryAbstract repository;

  GetChampionshipUseCase(this.repository);

  @override
  Future<Championship?> call(String link) async {
    return await repository.getChampionshipByLink(link);
  }
}
