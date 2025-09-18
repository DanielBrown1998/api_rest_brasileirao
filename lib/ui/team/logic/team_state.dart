part of 'team_cubit.dart';

abstract class TeamsState {}

class TeamsInitial extends TeamsState {}

class TeamsLoading extends TeamsState {}

class TeamsSuccess extends TeamsState {
  final Team? team;
  final List<Matchs>? matchs;
  TeamsSuccess(this.team, this.matchs);
}

class TeamsError extends TeamsState {
  final String message;
  TeamsError(this.message);
}
