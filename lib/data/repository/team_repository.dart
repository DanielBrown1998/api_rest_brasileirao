import 'package:api_rest_brasileirao/domain/entities/team.dart';
import 'package:api_rest_brasileirao/domain/repository/team_repository_abstract.dart';
import 'package:api_rest_brasileirao/data/services/api/api_teams.dart';

class TeamRepository extends TeamRepositoryAbstract {
  final ApiTeams _apiTeams;

  TeamRepository(this._apiTeams);

  @override
  Future<Team?> getTeam(String id) {
    return _apiTeams.getTeam(id);
  }

  @override
  Future<List<Team>?> getTeamLastGames(String id) {
    return _apiTeams.getTeamLastGames(id);
  }

  @override
  Future<List<Team>?> getTeamNextGames(String id) {
    return _apiTeams.getTeamNextGames(id);
  }
}
