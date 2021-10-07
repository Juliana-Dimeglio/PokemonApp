import 'generation.dart';

import '../../domain/entity/pokemon_past_types_entity.dart';
import 'pokemon_types.dart';

class PokemonPastTypes extends PokemonPastTypesEntity {
  PokemonPastTypes({
    required generation,
    required types,
  }) : super(
          generation: generation,
          types: types,
        );

  factory PokemonPastTypes.fromJson(Map<String, dynamic> parsedJson) {
    var typesJsonList = parsedJson['types'] as List<dynamic>;
    var typesList = <PokemonTypes>[];
    typesList = typesJsonList.map((i) => PokemonTypes.fromJson(i)).toList();

    return PokemonPastTypes(
      generation: Generation.fromJson(
        parsedJson['generation'],
      ),
      types: typesList,
    );
  }
}
