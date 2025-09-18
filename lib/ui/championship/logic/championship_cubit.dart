import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/domain/entities/table_field.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_championship_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_table_field_use_case_abstract.dart';
import 'package:api_rest_brasileirao/ui/championship/logic/championship_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChampionshipCubit extends Cubit<ChampionshipState> {
  Championship? championship;
  List<TableField>? tableField;
  final GetChampionshipUseCaseAbstract _getChampionshipUseCase;
  final GetTableFieldUseCaseAbstract _getTableFieldUseCase;

  ChampionshipCubit(this._getChampionshipUseCase, this._getTableFieldUseCase)
    : super(ChampionshipInitial());

  Future<void> getChampionship(String link) async {
    try {
      emit(ChampionshipLoading());
      // Reset previous data when fetching for a new championship
      tableField = null;
      championship = await _getChampionshipUseCase.call(link);
      emit(ChampionshipSuccess(championship, tableField));
    } catch (e) {
      emit(ChampionshipError(e.toString()));
    }
  }

  Future<void> getTableField(String link) async {
    try {
      emit(ChampionshipLoading());
      tableField = await _getTableFieldUseCase.call(link);
      emit(ChampionshipSuccess(championship, tableField));
    } catch (e) {
      emit(ChampionshipError(e.toString()));
    }
  }
}
