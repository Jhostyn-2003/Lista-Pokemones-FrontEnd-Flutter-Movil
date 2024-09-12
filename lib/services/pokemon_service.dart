import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class PokemonService {
  final String apiUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> fetchPokemonList(int limit) async {
    final response = await http.get(Uri.parse('$apiUrl?limit=$limit'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['results'];
      return Future.wait(data.map((pokemon) => fetchPokemonDetails(pokemon['url'])).toList());
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }

  Future<Pokemon> fetchPokemonDetails(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Pokémon details');
    }
  }
}
