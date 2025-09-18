import 'package:api_rest_brasileirao/domain/entities/team.dart';

abstract class GetTeamUseCaseAbstract {
  Future<Team?> call(String id);
}
