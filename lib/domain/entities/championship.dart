// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:api_rest_brasileirao/domain/entities/edition.dart';
import 'package:api_rest_brasileirao/domain/entities/play_off.dart';

class Championship {
  final int campeonatoId;
  final String nome;
  final String slug;
  final String nomePopular;
  final Edition edicaoAtual;
  final PlayOff faseAtual;
  dynamic rodadaAtual;
  final String status;
  final String tipo;
  final String logo;
  final String regiao;
  final String? link;
  final dynamic fases;
  Championship({
    required this.campeonatoId,
    required this.nome,
    required this.slug,
    required this.nomePopular,
    required this.edicaoAtual,
    required this.faseAtual,
    required this.status,
    required this.tipo,
    required this.logo,
    required this.regiao,
    this.link,
    this.rodadaAtual,
    this.fases,
  });

  Championship copyWith({
    int? campeonatoId,
    String? nome,
    String? slug,
    String? nomePopular,
    Edition? edicaoAtual,
    PlayOff? faseAtual,
    dynamic rodadaAtual,
    String? status,
    String? tipo,
    String? logo,
    String? regiao,
    String? link,
    dynamic fases,
  }) {
    return Championship(
      campeonatoId: campeonatoId ?? this.campeonatoId,
      nome: nome ?? this.nome,
      slug: slug ?? this.slug,
      nomePopular: nomePopular ?? this.nomePopular,
      edicaoAtual: edicaoAtual ?? this.edicaoAtual,
      faseAtual: faseAtual ?? this.faseAtual,
      rodadaAtual: rodadaAtual ?? this.rodadaAtual,
      status: status ?? this.status,
      tipo: tipo ?? this.tipo,
      logo: logo ?? this.logo,
      regiao: regiao ?? this.regiao,
      link: link ?? this.link,
      fases: fases ?? this.fases,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'campeonato_id': campeonatoId,
      'nome': nome,
      'slug': slug,
      'nome_popular': nomePopular,
      'edicao_atual': edicaoAtual.toMap(),
      'fase_atual': faseAtual.toMap(),
      'rodada_atual': rodadaAtual,
      'status': status,
      'tipo': tipo,
      'logo': logo,
      'regiao': regiao,
      '_link': link,
      'fases': fases,
    };
  }

  factory Championship.fromMap(Map<String, dynamic> map) {
    return Championship(
      campeonatoId: map['campeonato_id'] as int,
      nome: map['nome'] as String,
      slug: map['slug'] as String,
      nomePopular: map['nome_popular'] as String,
      edicaoAtual: Edition.fromMap(map['edicao_atual'] as Map<String, dynamic>),
      faseAtual: PlayOff.fromMap(map['fase_atual'] as Map<String, dynamic>),
      rodadaAtual: map['rodada_atual'] as dynamic ?? "",
      status: map['status'] as String,
      tipo: map['tipo'] as String,
      logo: map['logo'] as String,
      regiao: map['regiao'] as String,
      link: map['_link'] as String? ?? "",
      fases: map['fases'] as dynamic ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Championship.fromJson(String source) =>
      Championship.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Campeonato(campeonato_id: $campeonatoId, nome: $nome, slug: $slug, nome_popular: $nomePopular, edicao_atual: ${edicaoAtual.toString()}, fase_atual: ${faseAtual.toString()}, rodada_atual: ${rodadaAtual.toString()}, status: $status, tipo: $tipo, logo: $logo, regiao: $regiao, _link: $link, fases: ${fases.toString()})';
  }

  @override
  bool operator ==(covariant Championship other) {
    if (identical(this, other)) return true;

    return other.campeonatoId == campeonatoId &&
        other.nome == nome &&
        other.slug == slug &&
        other.nomePopular == nomePopular &&
        other.edicaoAtual == edicaoAtual &&
        other.faseAtual == faseAtual &&
        other.rodadaAtual == rodadaAtual &&
        other.status == status &&
        other.tipo == tipo &&
        other.logo == logo &&
        other.regiao == regiao &&
        other.link == link &&
        other.fases == fases;
  }

  @override
  int get hashCode {
    return campeonatoId.hashCode ^
        nome.hashCode ^
        slug.hashCode ^
        nomePopular.hashCode ^
        edicaoAtual.hashCode ^
        faseAtual.hashCode ^
        rodadaAtual.hashCode ^
        status.hashCode ^
        tipo.hashCode ^
        logo.hashCode ^
        regiao.hashCode ^
        link.hashCode ^
        fases.hashCode;
  }
}
