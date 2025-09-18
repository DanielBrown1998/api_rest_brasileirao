// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Team {
  final String escudo;
  final int timeId;
  final String nomePopular;
  final String sigla;
  final String? nome;
  final String? apelido;
  Team({
    required this.escudo,
    required this.timeId,
    required this.nomePopular,
    required this.sigla,
    this.nome,
    this.apelido,
  });

  Team copyWith({
    String? escudo,
    int? timeId,
    String? nomePopular,
    String? sigla,
    String? nome,
    String? apelido,
  }) {
    return Team(
      escudo: escudo ?? this.escudo,
      timeId: timeId ?? this.timeId,
      nomePopular: nomePopular ?? this.nomePopular,
      sigla: sigla ?? this.sigla,
      nome: nome ?? this.nome,
      apelido: apelido ?? this.apelido,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'escudo': escudo,
      'time_id': timeId,
      'nome_popular': nomePopular,
      'sigla': sigla,
      'nome': nome,
      'apelido': apelido,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      escudo: map['escudo'] as String,
      timeId: map['time_id'] as int,
      nomePopular: map['nome_popular'] as String,
      sigla: map['sigla'] as String,
      nome: map['nome'] != null ? map['nome'] as String : null,
      apelido: map['apelido'] != null ? map['apelido'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) =>
      Team.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Team(escudo: $escudo, time_id: $timeId, nome_popular: $nomePopular, sigla: $sigla, nome: $nome, apelido: $apelido)';
  }

  @override
  bool operator ==(covariant Team other) {
    if (identical(this, other)) return true;

    return other.escudo == escudo &&
        other.timeId == timeId &&
        other.nomePopular == nomePopular &&
        other.sigla == sigla &&
        other.nome == nome &&
        other.apelido == apelido;
  }

  @override
  int get hashCode {
    return escudo.hashCode ^
        timeId.hashCode ^
        nomePopular.hashCode ^
        sigla.hashCode ^
        nome.hashCode ^
        apelido.hashCode;
  }
}
