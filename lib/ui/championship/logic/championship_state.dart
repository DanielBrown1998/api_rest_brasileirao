import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/domain/entities/table_field.dart';

abstract class ChampionshipState {
  const ChampionshipState();
  List<Object?> get props => [];
}

class ChampionshipInitial extends ChampionshipState {}

class ChampionshipLoading extends ChampionshipState {}

class ChampionshipSuccess extends ChampionshipState {
  final Championship? championship;
  final List<TableField>? tableField;
  const ChampionshipSuccess(this.championship, this.tableField);
  @override
  List<Object?> get props => [championship, tableField];
}

class ChampionshipError extends ChampionshipState {
  final String message;
  const ChampionshipError(this.message);
  @override
  List<Object?> get props => [message];
}
