import 'dart:convert';

import 'package:api_rest_brasileirao/domain/entities/stadium.dart';

class Matchs {
  final int partidaId;
  final ChampionshipInfo campeonato;
  final String placar;
  final TeamInfo timeMandante;
  final TeamInfo timeVisitante;
  final int placarMandante;
  final int placarVisitante;
  final bool disputaPenalti;
  final String status;
  final String slug;
  final String dataRealizacao;
  final String horaRealizacao;
  final String dataRealizacaoIso;
  final Stadium estadio;

  Matchs({
    required this.partidaId,
    required this.campeonato,
    required this.placar,
    required this.timeMandante,
    required this.timeVisitante,
    required this.placarMandante,
    required this.placarVisitante,
    required this.disputaPenalti,
    required this.status,
    required this.slug,
    required this.dataRealizacao,
    required this.horaRealizacao,
    required this.dataRealizacaoIso,
    required this.estadio,
  });

  factory Matchs.fromMap(Map<String, dynamic> map) {
    return Matchs(
      partidaId: map['partida_id']?.toInt() ?? 0,
      campeonato: ChampionshipInfo.fromMap(map['campeonato']),
      placar: map['placar'] ?? '',
      timeMandante: TeamInfo.fromMap(map['time_mandante']),
      timeVisitante: TeamInfo.fromMap(map['time_visitante']),
      placarMandante: map['placar_mandante']?.toInt() ?? 0,
      placarVisitante: map['placar_visitante']?.toInt() ?? 0,
      disputaPenalti: map['disputa_penalti'] ?? false,
      status: map['status'] ?? '',
      slug: map['slug'] ?? '',
      dataRealizacao: map['data_realizacao'] ?? '',
      horaRealizacao: map['hora_realizacao'] ?? '',
      dataRealizacaoIso: map['data_realizacao_iso'] ?? '',
      estadio: Stadium.fromMap(map['estadio']),
    );
  }

  factory Matchs.fromJson(String source) => Matchs.fromMap(json.decode(source));
}

class ChampionshipInfo {
  final int campeonatoId;
  final String nome;
  final String slug;

  ChampionshipInfo({
    required this.campeonatoId,
    required this.nome,
    required this.slug,
  });

  factory ChampionshipInfo.fromMap(Map<String, dynamic> map) {
    return ChampionshipInfo(
      campeonatoId: map['campeonato_id']?.toInt() ?? 0,
      nome: map['nome'] ?? '',
      slug: map['slug'] ?? '',
    );
  }
}

class TeamInfo {
  final int timeId;
  final String nomePopular;
  final String sigla;
  final String escudo;

  TeamInfo({
    required this.timeId,
    required this.nomePopular,
    required this.sigla,
    required this.escudo,
  });

  factory TeamInfo.fromMap(Map<String, dynamic> map) {
    return TeamInfo(
      timeId: map['time_id']?.toInt() ?? 0,
      nomePopular: map['nome_popular'] ?? '',
      sigla: map['sigla'] ?? '',
      escudo: map['escudo'] ?? '',
    );
  }
}
