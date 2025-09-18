import 'package:api_rest_brasileirao/data/usecases/get_all_championships_use_case.dart';
import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/ui/championship/page/championship_page.dart';
import 'package:api_rest_brasileirao/ui/widgets/shield.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GetIt getIt;
  late GetAllChampionshipsUseCase championship;

  @override
  void initState() {
    getIt = GetIt.instance;
    championship = getIt.get<GetAllChampionshipsUseCase>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    // Map<String, dynamic> campeonato = {
    //   "campeonato_id": 58,
    //   "nome": "Campeonato Acreano",
    //   "slug": "campeonato-acreano",
    //   "nome_popular": "Acreano",
    //   "edicao_atual": {
    //     "edicao_id": 159,
    //     "temporada": "2025",
    //     "nome": "Campeonato Acreano 2025",
    //     "nome_popular": "Acreano 2025",
    //     "slug": "campeonato-acreano-2025",
    //   },
    //   "fase_atual": {
    //     "fase_id": 702,
    //     "nome": "Final",
    //     "slug": "final-acreano-2025",
    //     "tipo": "mata-mata",
    //     "_link": "/v1/campeonatos/58/fases/702",
    //   },
    //   "rodada_atual": null,
    //   "status": "finalizado",
    //   "tipo": "Misto",
    //   "logo":
    //       "https:\/\/cdn.api-futebol.com.br\/campeonatos\/logos\/campeonato-acreano.png",
    //   "regiao": "regional",
    //   "_link": "/v1/campeonatos/58",
    // };

    // Future<List<Championship>> getCampeonato() async {
    //   return [Championship.fromMap(campeonato)];
    // }

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 20,
        toolbarHeight: size.height * 0.13,
        titleSpacing: 2,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          side: BorderSide(color: theme.colorScheme.primary, width: 2),
        ),
        backgroundColor: theme.colorScheme.primary,
        centerTitle: true,
        elevation: 12,
        title: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            height: size.height * 0.1,
            width: size.width * 0.9,
            child: Center(
              child: Text(
                widget.title,
                style: theme.textTheme.titleLarge!.copyWith(fontSize: 40),
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        // future: championship.getAllChampionchips(),
        // future: getCampeonato(),
        future: championship.call(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("Nenhum dado encontrado"));
          }
          List<Championship> championschips = snapshot.data!;
          return ListView.builder(
            itemCount: championschips.length,
            itemBuilder: (context, index) {
              final camp = championschips[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: ContinuousRectangleBorder(
                    side: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  elevation: 10,
                  color: theme.colorScheme.primaryContainer,
                  child: ListTile(
                    style: ListTileStyle.list,
                    splashColor: theme.colorScheme.inversePrimary,
                    contentPadding: EdgeInsets.all(10),
                    title: Text(camp.nome),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ChampionshipPage(championship: camp);
                          },
                        ),
                      );
                    },
                    subtitle: Text(camp.edicaoAtual.nome),
                    leading: ShieldWidget(urlShield: camp.logo),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
