import 'package:api_rest_brasileirao/ui/home/page/home_page.dart';
import 'package:flutter/material.dart';

class FutebolApp extends StatelessWidget {
  const FutebolApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campeonatos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade800),
        useMaterial3: true,
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white60,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.white60,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            color: Colors.white60,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodyMedium: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          bodySmall: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
      home: HomePage(title: 'Futebol no Mundo'),
    );
  }
}
