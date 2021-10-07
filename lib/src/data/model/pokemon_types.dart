import 'pokemon_type.dart';

import '../../domain/entity/pokemon_types_entity.dart';

class PokemonTypes extends PokemonTypesEntity {
  PokemonTypes({
    required slot,
    required type,
  }) : super(
          slot: slot,
          type: type,
        );

  factory PokemonTypes.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonTypes(
      slot: parsedJson['slot'],
      type: PokemonType.fromJson(
        parsedJson['type'],
      ),
    );
  }
}
