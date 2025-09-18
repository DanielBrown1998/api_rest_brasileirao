import 'package:api_rest_brasileirao/domain/entities/table_field.dart';

abstract class GetTableFieldUseCaseAbstract {
  Future<List<TableField>?> call(String link);
}
