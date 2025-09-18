import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_all_championships_use_case_abstract.dart';
import 'package:bloc/bloc.dart';

part 'home_state.dart';

class HomeCubic extends Cubit<HomeState> {
  final GetAllChampionshipsUseCaseAbstract getAllChampionshipsUseCase;
  List<Championship>? championschips;

  HomeCubic({required this.getAllChampionshipsUseCase}) : super(HomeInitial());

  Future<void> getAllChampionships() async {
    emit(HomeLoading());
    try {
      championschips ??= await getAllChampionshipsUseCase.call();
      if (championschips != null && championschips!.isNotEmpty) {
        emit(HomeSuccess(championships: championschips!));
      } else {
        emit(const HomeError(message: 'Nenhum campeonato encontrado.'));
      }
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
