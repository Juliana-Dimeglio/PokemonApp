import 'ability_entity.dart';

class PokemonAbilitiesEntity {
  PokemonAbilitiesEntity({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  final bool isHidden;
  final int slot;
  final AbilityEntity ability;
}
