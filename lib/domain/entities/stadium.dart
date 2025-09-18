
import 'dart:convert';

class Stadium {
  final int estadioId;
  final String nomePopular;

  Stadium({
    required this.estadioId,
    required this.nomePopular,
  });

  Map<String, dynamic> toMap() {
    return {
      'estadio_id': estadioId,
      'nome_popular': nomePopular,
    };
  }

  factory Stadium.fromMap(Map<String, dynamic> map) {
    return Stadium(
      estadioId: map['estadio_id']?.toInt() ?? 0,
      nomePopular: map['nome_popular'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Stadium.fromJson(String source) => Stadium.fromMap(json.decode(source));
}
