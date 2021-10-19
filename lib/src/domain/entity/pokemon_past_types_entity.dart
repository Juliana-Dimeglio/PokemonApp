import '../../data/model/pokemon_types.dart';

import '../../data/model/generation.dart';

class PokemonPastTypesEntity {
  PokemonPastTypesEntity({
    required this.generation,
    required this.types,
  });

  final Generation generation;
  final List<PokemonTypes> types;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'generation': generation.toJson(),
      'types': types.map((e) => e.toJson()).toList(),
    };
  }
}
