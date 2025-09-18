import 'package:api_rest_brasileirao/domain/entities/team.dart';

abstract class TeamRepositoryAbstract {
  Future<List<Team>?> getTeamNextGames(String id) async {
    throw UnimplementedError();
  }

  Future<List<Team>?> getTeamLastGames(String id) async {
    throw UnimplementedError();
  }

  Future<Team?> getTeam(String id) async {
    throw UnimplementedError();
  }
}
