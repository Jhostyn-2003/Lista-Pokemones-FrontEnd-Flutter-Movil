import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/pokemon_provider.dart';
import '../widgets/pokemon_list_item.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PokemonProvider>(context, listen: false).fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                Provider.of<PokemonProvider>(context, listen: false).searchPokemon(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search Pokémon',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Consumer<PokemonProvider>(
              builder: (context, provider, child) {
                if (provider.pokemons.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: provider.pokemons.length,
                    itemBuilder: (context, index) {
                      return PokemonListItem(pokemon: provider.pokemons[index]);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
