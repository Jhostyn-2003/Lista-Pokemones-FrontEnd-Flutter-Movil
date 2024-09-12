import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'pokemon_list_page.dart';  // Tu pantalla principal donde muestras la lista de Pokémon.

class PokemonSplashScreen extends StatefulWidget {
  @override
  _PokemonSplashScreenState createState() => _PokemonSplashScreenState();
}

class _PokemonSplashScreenState extends State<PokemonSplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    // Esperar 3 segundos y luego redirigir a la pantalla principal.
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => PokemonListPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fondo de dos colores, rojo y blanco.
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.red, Colors.white],
              ),
            ),
          ),
          // Animación Lottie para la línea curva entre rojo y blanco.
          Positioned.fill(
            child: Lottie.asset(
              'assets/animations/pokemon_splash.json',
              controller: _controller,
              onLoaded: (composition) {
                _controller.forward();
              },
            ),
          ),
          // Imagen de los Pokémon en el centro.
          Center(
            child: Image.asset(
              'assets/images/pokemon_logo.png',
              width: 300, // Ajusta el tamaño según tu preferencia.
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
