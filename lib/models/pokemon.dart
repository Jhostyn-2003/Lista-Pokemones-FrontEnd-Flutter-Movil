class Pokemon {
  final String name;
  final String imageUrl;
  final List<String> abilities;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      abilities: List<String>.from(
        json['abilities'].map((ability) => ability['ability']['name']),
      ),
    );
  }
}
