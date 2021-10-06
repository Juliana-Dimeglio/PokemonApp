import '../../domain/entity/pokemon_abilities_entity.dart';

import 'ability.dart';

class PokemonAbilities extends PokemonAbilitiesEntity {
  PokemonAbilities({
    required isHidden,
    required slot,
    required ability,
  }) : super(
          isHidden: isHidden,
          slot: slot,
          ability: ability,
        );

  factory PokemonAbilities.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonAbilities(
      isHidden: parsedJson['is_hidden'],
      slot: parsedJson['slot'],
      ability: Ability.fromJson(
        parsedJson['ability'],
      ),
    );
  }
}
