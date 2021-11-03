import '../../data/model/pokemon.dart';
import '../../data/model/pokemon_results.dart';

class PokemonResponseEntity {
  PokemonResponseEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
    required this.pokemonResults,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<PokemonResults> results;
  final List<Pokemon> pokemonResults;
}
