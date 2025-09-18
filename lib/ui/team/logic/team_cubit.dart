import 'package:api_rest_brasileirao/domain/entities/team.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_team_use_case_abstract.dart';
import 'package:bloc/bloc.dart';

part 'team_state.dart';

class TeamsCubit extends Cubit<TeamsState> {
  final GetTeamUseCaseAbstract _getTeamUseCase;

  TeamsCubit(this._getTeamUseCase) : super(TeamsInitial());
  Future<void> getTeams(String link) async {
    try {
      emit(TeamsLoading());
      final team = await _getTeamUseCase.call(link);
      emit(TeamsSuccess(team));
    } catch (e) {
      emit(TeamsError(e.toString()));
    }
  }
}
