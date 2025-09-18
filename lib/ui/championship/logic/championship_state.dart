import 'package:api_rest_brasileirao/domain/entities/championship.dart';

abstract class ChampionshipState {
  const ChampionshipState();
  Object? get props => [];
}
class ChampionshipInitial extends ChampionshipState {}
class ChampionshipLoading extends ChampionshipState {}
class ChampionshipSuccess extends ChampionshipState {
  final Championship? championships;
  const ChampionshipSuccess(this.championships);
  @override
  Championship? get props => championships;
}
class ChampionshipError extends ChampionshipState {
  final String message;
  const ChampionshipError(this.message);
  @override
  List<Object> get props => [message];
}
