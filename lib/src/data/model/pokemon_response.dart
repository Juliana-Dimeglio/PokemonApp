import 'pokemon.dart';
import 'pokemon_results.dart';
import '../../domain/entity/pokemon_response_entity.dart';

class PokemonResponse extends PokemonResponseEntity {
  PokemonResponse({
    required count,
    required next,
    required previous,
    required results,
    pokemonResults,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          results: results,
          pokemonResults: [],
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

  PokemonResponse copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonResults>? results,
    List<Pokemon>? pokemonResults,
  }) {
    return PokemonResponse(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
      pokemonResults: pokemonResults ?? this.pokemonResults,
    );
  }
}
