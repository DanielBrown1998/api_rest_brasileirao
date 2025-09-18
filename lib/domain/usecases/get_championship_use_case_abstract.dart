import 'package:api_rest_brasileirao/domain/entities/championship.dart';

abstract class GetChampionshipUseCaseAbstract {
  Future<Championship?> call(String link);
}
