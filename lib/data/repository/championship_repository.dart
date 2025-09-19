import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/domain/entities/table_field.dart';
import 'package:api_rest_brasileirao/domain/repository/championship_repository_abstract.dart';
import 'package:api_rest_brasileirao/domain/source/championship_source.dart';

class ChampionshipRepository extends ChampionshipRepositoryAbstract {
  final ChampionshipSource _apiChampionship;

  ChampionshipRepository(this._apiChampionship);

  @override
  Future<List<Championship>?> getAllChampionchips() {
    return _apiChampionship.getAllChampionchips();
  }

  @override
  Future<Championship?> getChampionshipByLink(String link) {
    return _apiChampionship.getChampionshipByLink(link);
  }

  @override
  Future<List<TableField>?> getChampionshipTableByLink(String link) {
    return _apiChampionship.getChampionshipTableByLink(link);
  }
}
