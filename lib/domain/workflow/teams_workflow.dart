import 'package:api_rest_brasileirao/domain/entities/match.dart';
import 'package:api_rest_brasileirao/domain/entities/team.dart';

abstract class TeamsWorkflow {
  Future<List<Matchs>?> getTeamNextGames(String id) async {
    throw UnimplementedError();
  }

  Future<List<Matchs>?> getTeamLastGames(String id) async {
    throw UnimplementedError();
  }

  Future<Team?> getTeam(String id) async {
    throw UnimplementedError();
  }
}
