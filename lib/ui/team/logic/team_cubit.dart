import 'package:api_rest_brasileirao/domain/entities/match.dart';
import 'package:api_rest_brasileirao/domain/entities/team.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_next_matches_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_team_use_case_abstract.dart';
import 'package:bloc/bloc.dart';

part 'team_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  Team? team;
  List<Matchs>? matchs;
  final GetTeamUseCaseAbstract _getTeamUseCase;
  final GetNextMatchesUseCaseAbstract _getNextMatchesUseCase;

  TeamsCubit(this._getTeamUseCase, this._getNextMatchesUseCase)
    : super(TeamsInitial());

  Future<void> getNextMatches(String id) async {
    // try {
      emit(TeamsLoading());
      final matchs = await _getNextMatchesUseCase.call(id);
      emit(TeamsSuccess(team, matchs));
    // } catch (e) {
    //   emit(TeamsError(e.toString()));
    // }
  }

  Future<void> getTeams(String id) async {
    try {
      emit(TeamsLoading());
      final team = await _getTeamUseCase.call(id);
      emit(TeamsSuccess(team, matchs));
    } catch (e) {
      emit(TeamsError(e.toString()));
    }
  }
}
