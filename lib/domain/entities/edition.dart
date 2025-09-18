// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Edition {
  final int edicaoId;
  final String temporada;
  final String nome;
  final String nomePopular;
  final String slug;
  Edition({
    required this.edicaoId,
    required this.temporada,
    required this.nome,
    required this.nomePopular,
    required this.slug,
  });

  Edition copyWith({
    int? edicaoId,
    String? temporada,
    String? nome,
    String? nomePopular,
    String? slug,
  }) {
    return Edition(
      edicaoId: edicaoId ?? this.edicaoId,
      temporada: temporada ?? this.temporada,
      nome: nome ?? this.nome,
      nomePopular: nomePopular ?? this.nomePopular,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'edicao_id': edicaoId,
      'temporada': temporada,
      'nome': nome,
      'nome_popular': nomePopular,
      'slug': slug,
    };
  }

  factory Edition.fromMap(Map<String, dynamic> map) {
    return Edition(
      edicaoId: map['edicao_id'] as int,
      temporada: map['temporada'] as String,
      nome: map['nome'] as String,
      nomePopular: map['nome_popular'] as String,
      slug: map['slug'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Edition.fromJson(String source) =>
      Edition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Edicao(edicao_id: $edicaoId, temporada: $temporada, nome: $nome, nome_popular: $nomePopular, slug: $slug)';
  }

  @override
  bool operator ==(covariant Edition other) {
    if (identical(this, other)) return true;

    return other.edicaoId == edicaoId &&
        other.temporada == temporada &&
        other.nome == nome &&
        other.nomePopular == nomePopular &&
        other.slug == slug;
  }

  @override
  int get hashCode {
    return edicaoId.hashCode ^
        temporada.hashCode ^
        nome.hashCode ^
        nomePopular.hashCode ^
        slug.hashCode;
  }
}
