import 'pokemon_results.dart';

import '../../domain/entity/pokemon_response_entity.dart';

class PokemonResponse extends PokemonResponseEntity {
  PokemonResponse({
    required count,
    required next,
    required previous,
    required results,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          results: results,
        );

  factory PokemonResponse.fromJson(Map<String, dynamic> parsedJson) {
    var pokemonResultsJsonList = parsedJson['results'] as List<dynamic>;
    var pokemonResultsList = <PokemonResults>[];
    pokemonResultsList =
        pokemonResultsJsonList.map((i) => PokemonResults.fromJson(i)).toList();

    return PokemonResponse(
      count: parsedJson['count'],
      next: parsedJson['next'],
      previous: parsedJson['previous'],
      results: pokemonResultsList,
    );
  }
}
