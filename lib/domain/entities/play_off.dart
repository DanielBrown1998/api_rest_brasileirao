// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlayOff {
  final int faseId;
  final String nome;
  final String slug;
  final String tipo;
  final String link;
  PlayOff({
    required this.faseId,
    required this.nome,
    required this.slug,
    required this.tipo,
    required this.link,
  });

  PlayOff copyWith({
    int? faseId,
    String? nome,
    String? slug,
    String? tipo,
    String? link,
  }) {
    return PlayOff(
      faseId: faseId ?? this.faseId,
      nome: nome ?? this.nome,
      slug: slug ?? this.slug,
      tipo: tipo ?? this.tipo,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fase_id': faseId,
      'nome': nome,
      'slug': slug,
      'tipo': tipo,
      '_link': link,
    };
  }

  factory PlayOff.fromMap(Map<String, dynamic> map) {
    return PlayOff(
      faseId: map['fase_id'] as int,
      nome: map['nome'] as String,
      slug: map['slug'] as String,
      tipo: map['tipo'] as String,
      link: map['_link'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayOff.fromJson(String source) =>
      PlayOff.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Fase(fase_id: $faseId, nome: $nome, slug: $slug, tipo: $tipo, _link: $link)';
  }

  @override
  bool operator ==(covariant PlayOff other) {
    if (identical(this, other)) return true;

    return other.faseId == faseId &&
        other.nome == nome &&
        other.slug == slug &&
        other.tipo == tipo &&
        other.link == link;
  }

  @override
  int get hashCode {
    return faseId.hashCode ^
        nome.hashCode ^
        slug.hashCode ^
        tipo.hashCode ^
        link.hashCode;
  }
}
