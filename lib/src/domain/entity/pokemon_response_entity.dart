import '../../data/model/pokemon_results.dart';

class PokemonResponseEntity {
  PokemonResponseEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<PokemonResults> results;
}
