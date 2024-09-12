import 'package:flutter/material.dart';
import '../../models/pokemon.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonListItem({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.network(pokemon.imageUrl, height: 80, width: 80),
          ),
          Expanded(
            flex: 3,
            child: _PokemonDescription(
              name: pokemon.name,
              abilities: pokemon.abilities,
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}

class _PokemonDescription extends StatelessWidget {
  final String name;
  final List<String> abilities;

  const _PokemonDescription({
    required this.name,
    required this.abilities,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            'Abilities: ${abilities.join(', ')}',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
