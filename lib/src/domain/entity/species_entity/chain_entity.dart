import '../../../data/model/species_response/chain.dart';

import '../../../data/model/pokemon_species.dart';

class ChainEntity {
  ChainEntity({
    required this.evolvesTo,
    required this.species,
  });

  final List<Chain> evolvesTo;
  final PokemonSpecies species;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'evolves_to': evolvesTo,
      'species': species,
    };
  }
}
