import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/pokemon_provider.dart';
import 'views/pages/pokemon_splash_screen.dart';  // Importa el Splash Screen animado.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
      ],
      child: MaterialApp(
        title: 'Pokémon App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PokemonSplashScreen(), // Splash Screen es la pantalla inicial
      ),
    );
  }
}
