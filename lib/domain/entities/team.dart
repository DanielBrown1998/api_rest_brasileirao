// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Team {
  final String escudo;
  final String timeId;
  final String nomePopular;
  final String sigla;
  Team({
    required this.escudo,
    required this.timeId,
    required this.nomePopular,
    required this.sigla,
  });

  Team copyWith({
    String? escudo,
    String? timeId,
    String? nomePopular,
    String? sigla,
  }) {
    return Team(
      escudo: escudo ?? this.escudo,
      timeId: timeId ?? this.timeId,
      nomePopular: nomePopular ?? this.nomePopular,
      sigla: sigla ?? this.sigla,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'escudo': escudo,
      'time_id': timeId,
      'nome_popular': nomePopular,
      'sigla': sigla,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      escudo: map['escudo'] as String,
      timeId: map['time_id'] as String,
      nomePopular: map['nome_popular'] as String,
      sigla: map['sigla'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) =>
      Team.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Time(escudo: $escudo, time_id: $timeId, nome_popular: $nomePopular, sigla: $sigla)';
  }

  @override
  bool operator ==(covariant Team other) {
    if (identical(this, other)) return true;

    return other.escudo == escudo &&
        other.timeId == timeId &&
        other.nomePopular == nomePopular &&
        other.sigla == sigla;
  }

  @override
  int get hashCode {
    return escudo.hashCode ^
        timeId.hashCode ^
        nomePopular.hashCode ^
        sigla.hashCode;
  }
}
