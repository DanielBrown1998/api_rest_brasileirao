import 'package:api_rest_brasileirao/domain/entities/match.dart';

abstract class GetNextMatchesUseCaseAbstract {
  Future<List<Matchs>?> call(String id);
}
