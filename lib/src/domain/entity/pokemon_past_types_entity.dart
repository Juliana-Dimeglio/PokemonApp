import '../../data/model/pokemon_types.dart';

import '../../data/model/generation.dart';

class PokemonPastTypesEntity {
  PokemonPastTypesEntity({
    required this.generation,
    required this.types,
  });

  final Generation generation;
  final List<PokemonTypes> types;
}
