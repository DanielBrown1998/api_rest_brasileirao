import 'dart:convert';

import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/domain/entities/table_field.dart';
import 'package:api_rest_brasileirao/domain/workflow/championship_workflow.dart';
import 'package:api_rest_brasileirao/utils/api_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ApiChampionship implements ChampionshipWorkflow{
  final String url = ApiUtils.urlRoot;
  final String token = ApiUtils.apiUtilsTokenHotmail;

  Future<http.Response> _get(String url) async {
    return await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );
  }

  @override
  Future<List<Championship>?> getAllChampionchips() async {
    String allChampionshipsUrl = "$url/v1/campeonatos";

    var response = await _get(allChampionshipsUrl);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<dynamic> decoded = jsonDecode(response.body);
      var result = decoded.map((element) {
        final campeonato = Championship.fromMap(element);
        return campeonato;
      }).toList();
      return result;
    }
    return null;
  }

  @override
  Future<Championship?> getChampionshipByLink(String link) async {
    String urlWithId = "$url/$link";
    debugPrint(urlWithId);
    var response = await _get(urlWithId);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      var decoded = jsonDecode(response.body);
      final campeonato = Championship.fromMap(decoded);
      return campeonato;
    }
    return null;
  }

  @override
  Future<List<TableField>?> getChampionshipTableByLink(String link) async {
    String urlWithId = "$url$link/tabela";
    debugPrint(urlWithId);
    var response = await _get(urlWithId);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      List<dynamic> decoded = jsonDecode(response.body);
      debugPrint(decoded.toString());
      return decoded.map((e) => TableField.fromMap(e)).toList();
    }
    return null;
  }
}
