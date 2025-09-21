import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_all_championships_use_case_abstract.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'home_state.dart';

class HomeCubic extends Cubit<HomeState> {
  final GetAllChampionshipsUseCaseAbstract getAllChampionshipsUseCase;
  List<Championship>? championschips;

  //for test only
  Map<String, dynamic> brasileiraoB = {
    "campeonato_id": 14,
    "nome": "Campeonato Brasileiro Série B",
    "slug": "campeonato-brasileiro-serie-b",
    "nome_popular": "Brasileirão Série B",
    "edicao_atual": {
      "edicao_id": 180,
      "temporada": "2025",
      "nome": "Campeonato Brasileiro Série B 2025",
      "nome_popular": "Brasileirão Série B 2025",
      "slug": "campeonato-brasileiro-serie-b-2025",
    },
    "fase_atual": {
      "fase_id": 769,
      "nome": "Fase única",
      "slug": "brasileiro-serie-b-2025-fase-unica",
      "tipo": "pontos-corridos",
      "_link": "/v1/campeonatos/14/fases/769",
    },
    "rodada_atual": {
      "nome": "27ª Rodada",
      "slug": "27a-rodada",
      "rodada": 27,
      "status": "agendada",
    },
    "status": "andamento",
    "tipo": "Pontos Corridos",
    "logo":
        "https://api.api-futebol.com.br/images/competicao/brasileiro-serieb.png",
    "regiao": "nacional",
    "_link": "/v1/campeonatos/14",
    "fases": "",
  };
  Future<List<Championship>> getCampeonato() async {
    Future.delayed(Duration(seconds: 2));
    final Championship campeonatoSerieB = Championship.fromMap(brasileiraoB);
    return [campeonatoSerieB];
  }

  HomeCubic({required this.getAllChampionshipsUseCase}) : super(HomeInitial());

  Future<void> getAllChampionships() async {
    try {
      emit(HomeLoading());
      //for test only
      championschips ??= await getCampeonato();
      // championschips ??= await getAllChampionshipsUseCase.call();
      debugPrint(championschips.toString());
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
