import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/domain/entities/table_field.dart';

abstract class ChampionshipWorkflow {
  Future<List<Championship>?> getAllChampionchips() async {
    throw UnimplementedError();
  }

  Future<Championship?> getChampionshipByLink(String link) async {
    throw UnimplementedError();
  }

  Future<List<TableField>?> getChampionshipTableByLink(String link) async {
    throw UnimplementedError();
  }
}
