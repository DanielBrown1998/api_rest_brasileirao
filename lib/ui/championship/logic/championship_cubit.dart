import 'package:api_rest_brasileirao/data/usecases/get_championship_use_case.dart';
import 'package:api_rest_brasileirao/ui/championship/logic/championship_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChampionshipCubit extends Cubit<ChampionshipState> {
  final GetChampionshipUseCase _getChampionshipUseCase;

  ChampionshipCubit(this._getChampionshipUseCase)
    : super(ChampionshipInitial());

  Future<void> getChampionships(String link) async {
    try {
      emit(ChampionshipLoading());
      final championships = await _getChampionshipUseCase.call(link);
      emit(ChampionshipSuccess(championships));
    } catch (e) {
      emit(ChampionshipError(e.toString()));
    }
  }
}
