import 'package:api_rest_brasileirao/domain/entities/championship.dart';
import 'package:api_rest_brasileirao/domain/entities/table_field.dart';
import 'package:api_rest_brasileirao/ui/championship/logic/championship_cubit.dart';
import 'package:api_rest_brasileirao/ui/championship/logic/championship_state.dart';
import 'package:api_rest_brasileirao/ui/team/page/team.dart';
import 'package:api_rest_brasileirao/ui/widgets/shield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChampionshipPage extends StatefulWidget {
  final Championship championship;

  const ChampionshipPage({super.key, required this.championship});

  @override
  State<ChampionshipPage> createState() => _ChampionshipPageState();
}

class _ChampionshipPageState extends State<ChampionshipPage> {
  @override
  void initState() {
    super.initState();
    context.read<ChampionshipCubit>().getChampionship(
      widget.championship.link!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.13,
        titleSpacing: 0,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
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
            Text(widget.championship.nome, style: theme.textTheme.titleLarge),
          ],
        ),
      ),
      body: BlocBuilder<ChampionshipCubit, ChampionshipState>(
        builder: (_, state) {
          if (state is ChampionshipLoading || state is ChampionshipInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ChampionshipError) {
            return Center(child: Text(state.message));
          }
          if (state is ChampionshipSuccess) {
            return _ChampionshipDetails(
              championship: widget.championship,
              table: state.tableField,
            );
          }
          return const Center(child: Text("Nenhum dado encontrado"));
        },
      ),
    );
  }
}

class _ChampionshipDetails extends StatelessWidget {
  final Championship championship;
  final List<TableField>? table;

  const _ChampionshipDetails({required this.championship, this.table});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const padding = EdgeInsets.all(8.0);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ShieldWidget(
              urlShield: championship.logo,
              height: 150,
              width: 150,
            ),
          ),
          const SizedBox(height: 24),
          _InfoTile(
            label: "Nome popular",
            value: championship.nomePopular,
            padding: padding,
          ),
          _InfoTile(
            label: "Fase Atual",
            value: championship.faseAtual.nome,
            padding: padding,
          ),
          _InfoTile(
            label: "Edição Atual",
            value: championship.edicaoAtual.nome,
            padding: padding,
          ),
          _InfoTile(
            label: "Região",
            value: championship.regiao,
            padding: padding,
          ),
          _InfoTile(
            label: "Status",
            value: championship.status,
            padding: padding,
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                context.read<ChampionshipCubit>().getTableField(
                  championship.link!,
                );
              },
              child: Text("Ver tabela", style: theme.textTheme.titleMedium),
            ),
          ),
          if (table != null) ...[
            const SizedBox(height: 24),
            Text(
              championship.edicaoAtual.nome,
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            _ChampionshipTable(table: table!),
          ],
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final EdgeInsetsGeometry padding;

  const _InfoTile({
    required this.label,
    required this.value,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: padding,
      child: Text.rich(
        TextSpan(
          text: '$label: ',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: value,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChampionshipTable extends StatelessWidget {
  final List<TableField> table;
  const _ChampionshipTable({required this.table});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: table.length,
      itemBuilder: (context, index) {
        final field = table[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          child: ListTile(
            leading: ShieldWidget(
              urlShield: field.time.escudo,
              width: 40,
              height: 40,
            ),
            title: Text(field.time.nomePopular),
            subtitle: Text('Últimos jogos: ${field.ultimosJogos.join(', ')}'),
            trailing: Text(
              '${field.pontos} pts',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeamPage(team: field.time),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
