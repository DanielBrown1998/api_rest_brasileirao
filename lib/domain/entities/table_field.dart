// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:api_rest_brasileirao/domain/entities/team.dart';

class TableField {
  final int posicao;
  final int pontos;
  final Team time;
  final int jogos;
  final int vitorias;
  final int empates;
  final int derrotas;
  final int golsPro;
  final int golsContra;
  final int saldoGols;
  final int aproveitamento;
  final int variacaoPosicao;
  final List<dynamic> ultimosJogos;
  TableField({
    required this.posicao,
    required this.pontos,
    required this.time,
    required this.jogos,
    required this.vitorias,
    required this.empates,
    required this.derrotas,
    required this.golsPro,
    required this.golsContra,
    required this.saldoGols,
    required this.aproveitamento,
    required this.variacaoPosicao,
    required this.ultimosJogos,
  });

  TableField copyWith({
    int? posicao,
    int? pontos,
    Team? time,
    int? jogos,
    int? vitorias,
    int? empates,
    int? derrotas,
    int? golsPro,
    int? golsContra,
    int? saldoGols,
    int? aproveitamento,
    int? variacaoPosicao,
    List<dynamic>? ultimosJogos,
  }) {
    return TableField(
      posicao: posicao ?? this.posicao,
      pontos: pontos ?? this.pontos,
      time: time ?? this.time,
      jogos: jogos ?? this.jogos,
      vitorias: vitorias ?? this.vitorias,
      empates: empates ?? this.empates,
      derrotas: derrotas ?? this.derrotas,
      golsPro: golsPro ?? this.golsPro,
      golsContra: golsContra ?? this.golsContra,
      saldoGols: saldoGols ?? this.saldoGols,
      aproveitamento: aproveitamento ?? this.aproveitamento,
      variacaoPosicao: variacaoPosicao ?? this.variacaoPosicao,
      ultimosJogos: ultimosJogos ?? this.ultimosJogos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posicao': posicao,
      'pontos': pontos,
      'time': time.toMap(),
      'jogos': jogos,
      'vitorias': vitorias,
      'empates': empates,
      'derrotas': derrotas,
      'gols_pro': golsPro,
      'gols_contra': golsContra,
      'saldo_gols': saldoGols,
      'aproveitamento': aproveitamento,
      'variacao_posicao': variacaoPosicao,
      'ultimos_jogos': ultimosJogos,
    };
  }

  factory TableField.fromMap(Map<String, dynamic> map) {
    return TableField(
      posicao: map['posicao'] as int,
      pontos: map['pontos'] as int,
      time: Team.fromMap(map['time'] as Map<String, dynamic>),
      jogos: map['jogos'] as int,
      vitorias: map['vitorias'] as int,
      empates: map['empates'] as int,
      derrotas: map['derrotas'] as int,
      golsPro: map['gols_pro'] as int,
      golsContra: map['gols_contra'] as int,
      saldoGols: map['saldo_gols'] as int,
      aproveitamento: map['aproveitamento'] as int,
      variacaoPosicao: map['variacao_posicao'] as int,
      ultimosJogos: List<dynamic>.from((map['ultimos_jogos'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory TableField.fromJson(String source) =>
      TableField.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TabelaField(posicao: $posicao, pontos: $pontos, time: $time, jogos: $jogos, vitorias: $vitorias, empates: $empates, derrotas: $derrotas, gols_pro: $golsPro, gols_contra: $golsContra, saldo_gols: $saldoGols, aproveitamento: $aproveitamento, variaacao_posicao: $variacaoPosicao, ultimos_jogos: $ultimosJogos)';
  }

  @override
  bool operator ==(covariant TableField other) {
    if (identical(this, other)) return true;

    return other.posicao == posicao &&
        other.pontos == pontos &&
        other.time == time &&
        other.jogos == jogos &&
        other.vitorias == vitorias &&
        other.empates == empates &&
        other.derrotas == derrotas &&
        other.golsPro == golsPro &&
        other.golsContra == golsContra &&
        other.saldoGols == saldoGols &&
        other.aproveitamento == aproveitamento &&
        other.variacaoPosicao == variacaoPosicao &&
        listEquals(other.ultimosJogos, ultimosJogos);
  }

  @override
  int get hashCode {
    return posicao.hashCode ^
        pontos.hashCode ^
        time.hashCode ^
        jogos.hashCode ^
        vitorias.hashCode ^
        empates.hashCode ^
        derrotas.hashCode ^
        golsPro.hashCode ^
        golsContra.hashCode ^
        saldoGols.hashCode ^
        aproveitamento.hashCode ^
        variacaoPosicao.hashCode ^
        ultimosJogos.hashCode;
  }
}
