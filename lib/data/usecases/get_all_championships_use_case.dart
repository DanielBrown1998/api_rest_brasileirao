import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/domain/repository/championship_repository_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_all_championships_use_case_abstract.dart';

class GetAllChampionshipsUseCase implements GetAllChampionshipsUseCaseAbstract {
  final ChampionshipRepositoryAbstract repository;

  GetAllChampionshipsUseCase(this.repository);

  @override
  Future<List<Championship>?> call() async {
    return await repository.getAllChampionchips();
  }
}
