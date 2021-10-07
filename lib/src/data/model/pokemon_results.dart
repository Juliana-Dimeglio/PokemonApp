import '../../domain/entity/pokemon_results_entity.dart';

class PokemonResults extends PokemonResultsEntity {
  PokemonResults({
    required name,
    required url,
  }) : super(
          name: name,
          url: url,
        );

  factory PokemonResults.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonResults(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
