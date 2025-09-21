import 'package:api_rest_brasileirao/ui/championship/page/championship_page.dart';
import 'package:api_rest_brasileirao/ui/home/logic/home_cubic.dart';
import 'package:api_rest_brasileirao/ui/widgets/custom_app_bar.dart';
import 'package:api_rest_brasileirao/ui/widgets/shield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: CustomAppBar(
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
      body: BlocBuilder<HomeCubic, HomeState>(
        builder: (_, state) {
          HomeCubic cubit = BlocProvider.of<HomeCubic>(context, listen: false);
          if (state is HomeInitial) {
            cubit.getAllChampionships();
          }
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HomeError) {
            return Center(child: Text(state.message));
          }
          if (state is HomeSuccess) {
            return ListView.builder(
              itemCount: cubit.championschips!.length,
              itemBuilder: (context, index) {
                final camp = cubit.championschips![index];
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
          }
          return const Center(child: Text("Nenhum dado encontrado"));
        },
      ),
    );
  }
}
