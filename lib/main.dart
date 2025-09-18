import 'package:api_rest_brasileirao/config/app_config.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_all_championships_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_championship_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_next_matches_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_table_field_use_case_abstract.dart';
import 'package:api_rest_brasileirao/domain/usecases/get_team_use_case_abstract.dart';
import 'package:api_rest_brasileirao/get_it_injection.dart';
import 'package:api_rest_brasileirao/ui/home/logic/home_cubic.dart';
import 'package:api_rest_brasileirao/ui/championship/logic/championship_cubit.dart';
import 'package:api_rest_brasileirao/ui/team/logic/team_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setupGetIt();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubic(
            getAllChampionshipsUseCase: getIt
                .get<GetAllChampionshipsUseCaseAbstract>(),
          ),
        ),
        BlocProvider(
          create: (context) => ChampionshipCubit(
            getIt.get<GetChampionshipUseCaseAbstract>(),
            getIt.get<GetTableFieldUseCaseAbstract>(),
          ),
        ),
        BlocProvider(
          create: (context) => TeamsCubit(
            getIt.get<GetTeamUseCaseAbstract>(),
            getIt.get<GetNextMatchesUseCaseAbstract>(),
          ),
        ),
      ],
      child: const FutebolApp(),
    ),
  );
}
