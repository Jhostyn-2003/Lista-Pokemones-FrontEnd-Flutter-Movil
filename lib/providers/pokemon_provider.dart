import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/pokemon_service.dart';

class PokemonProvider with ChangeNotifier {
  final PokemonService _pokemonService = PokemonService();
  List<Pokemon> _pokemons = [];
  List<Pokemon> _filteredPokemons = [];

  List<Pokemon> get pokemons => _filteredPokemons;

  Future<void> fetchPokemons() async {
    _pokemons = await _pokemonService.fetchPokemonList(50); // Obtén 50 Pokémon
    _filteredPokemons = _pokemons;
    notifyListeners();
  }

  void searchPokemon(String query) {
    if (query.isEmpty) {
      _filteredPokemons = _pokemons;
    } else {
      _filteredPokemons = _pokemons
          .where((pokemon) => pokemon.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
