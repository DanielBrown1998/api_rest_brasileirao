import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/data/services/api/api_championship.dart';
import 'package:api_rest_brasileirao/ui/widgets/shield.dart';
import 'package:flutter/material.dart';

class ChampionshipPage extends StatelessWidget {
  final Championship championship;
  final ApiChampionship championshipApi = ApiChampionship();

  ChampionshipPage({super.key, required this.championship});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(championship.nome, style: theme.textTheme.titleLarge),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nome popular: ${championship.nomePopular}",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  Center(
                    child: ShieldWidget(
                      urlShield: championship.logo,
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Fase Atual: ${championship.faseAtual.nome}",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Edicao Atual: ${championship.edicaoAtual.nome}",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "REGIÃO: ${championship.regiao}",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "STATUS: ${championship.status}",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        theme.colorScheme.primary,
                      ),
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: theme.colorScheme.primary,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      //add route tabela
                    },
                    child: Text(
                      "Ver tabela",
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
