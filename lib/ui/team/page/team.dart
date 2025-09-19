import 'package:api_rest_brasileirao/domain/entities/team.dart';
import 'package:api_rest_brasileirao/ui/team/logic/team_cubit.dart';
import 'package:api_rest_brasileirao/ui/widgets/custom_app_bar.dart';
import 'package:api_rest_brasileirao/ui/widgets/shield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeamPage extends StatelessWidget {
  final Team team;
  const TeamPage({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(team.nomePopular, style: theme.textTheme.titleLarge)],
        ),
      ),
      body: BlocBuilder<TeamsCubit, TeamsState>(
        builder: (context, state) {
          TeamsCubit cubit = BlocProvider.of<TeamsCubit>(
            context,
            listen: false,
          );
          cubit.team = team;

          if (state is TeamsInitial) {
            cubit.getNextMatches(team.timeId.toString());
          }
          if (state is TeamsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TeamsError) {
            return Center(child: Text(state.message));
          }
          if (state is TeamsSuccess) {
            return LayoutBuilder(
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
                        Center(
                          child: ShieldWidget(
                            urlShield: team.escudo,
                            height: 150,
                            width: 150,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Nome: ${team.nomePopular}",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Sigla: ${team.sigla}",
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Próximos Jogos:",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                        if (state.matchs != null && state.matchs!.isNotEmpty)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.matchs!.length > 3
                                ? 3
                                : state.matchs!.length,
                            itemBuilder: (context, index) {
                              final match = state.matchs![index];
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    '${match.timeMandante.nomePopular} x ${match.timeVisitante.nomePopular}',
                                  ),
                                  subtitle: Text(
                                    '${match.dataRealizacao} - ${match.horaRealizacao}\n${match.estadio.nomePopular}',
                                  ),
                                  leading: ShieldWidget(
                                    urlShield: match.timeMandante.escudo,
                                    width: 40,
                                    height: 40,
                                  ),
                                  trailing: ShieldWidget(
                                    urlShield: match.timeVisitante.escudo,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              );
                            },
                          )
                        else
                          const Center(child: Text("Nenhum jogo encontrado")),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(child: Text("Nenhum dado encontrado"));
        },
      ),
    );
  }
}
