import '../../domain/entity/pokemon_species_entity.dart';

class PokemonSpecies extends PokemonSpeciesEntity {
  PokemonSpecies({
    required name,
    required url,
  }) : super(
          name: name,
          url: url,
        );

  factory PokemonSpecies.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonSpecies(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
