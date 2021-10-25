import '../pokemon_species.dart';
import '../../../domain/entity/species_entity/chain_entity.dart';

class Chain extends ChainEntity {
  Chain({
    required evolvesTo,
    required species,
  }) : super(
          evolvesTo: evolvesTo,
          species: species,
        );

  factory Chain.fromJson(Map<String, dynamic> parsedJson) {
    var evolvesToJsonList = parsedJson['evolves_to'] as List<dynamic>;
    var evolvesToList = <Chain>[];
    evolvesToList = evolvesToJsonList.map((i) => Chain.fromJson(i)).toList();
    return Chain(
      evolvesTo: evolvesToList,
      species: PokemonSpecies.fromJson(
        parsedJson['species'],
      ),
    );
  }
}
