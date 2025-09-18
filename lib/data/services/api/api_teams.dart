import 'dart:convert';

import 'package:api_rest_brasileirao/domain/entities/team.dart';
import 'package:api_rest_brasileirao/domain/repository/team_repository_abstract.dart';
import 'package:api_rest_brasileirao/utils/api_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiTeams implements TeamRepositoryAbstract {
  final String url = ApiUtils.urlRoot;
  final String token = ApiUtils.apiUtilsTokenGmail;

  Future<http.Response> _get(String url) async {
    return await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );
  }

  @override
  Future<Team?> getTeam(String id) async {
    String allTeamsUrl = "$url/v1/times/$id";

    var response = await _get(allTeamsUrl);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<dynamic> decoded = jsonDecode(response.body);
      decoded.map((element) {
        final team = Team.fromMap(element);
        if (team.timeId == id) {
          return team;
        }
        return team;
      }).toList();
    }
    return null;
  }

  @override
  Future<List<Team>?> getTeamLastGames(String id) async {
    String urlWithId = "$url/v1/times/$id/partidas/anteriores";
    debugPrint(urlWithId);
    var response = await _get(urlWithId);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<dynamic> decoded = jsonDecode(response.body);
      var result = decoded.map((element) {
        final team = Team.fromMap(element);
        return team;
      }).toList();
      return result;
    }
    return null;
  }

  @override
  Future<List<Team>?> getTeamNextGames(String id) async {
    String urlWithId = "$url/v1/times/$id/partidas/proximas";
    debugPrint(urlWithId);
    var response = await _get(urlWithId);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<dynamic> decoded = jsonDecode(response.body);
      var result = decoded.map((element) {
        final team = Team.fromMap(element);
        return team;
      }).toList();
      return result;
    }
    return null;
  }
}
