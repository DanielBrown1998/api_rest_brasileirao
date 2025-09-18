import 'package:api_rest_brasileirao/domain/entities/championship.dart';

abstract class GetAllChampionshipsUseCaseAbstract {
  Future<List<Championship>?> call();
}
