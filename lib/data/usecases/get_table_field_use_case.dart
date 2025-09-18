import 'package:api_rest_brasileirao/domain/entities/table_field.dart';
import 'package:api_rest_brasileirao/domain/repository/championship_repository_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_table_field_use_case_abstract.dart';

class GetTableFieldUseCase implements GetTableFieldUseCaseAbstract {
  final ChampionshipRepositoryAbstract repository;

  GetTableFieldUseCase(this.repository);

  @override
  Future<List<TableField>?> call(String link) async {
    return await repository.getChampionshipTableByLink(link);
  }
}
