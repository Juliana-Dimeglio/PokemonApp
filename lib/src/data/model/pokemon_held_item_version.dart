import 'version.dart';

import '../../domain/entity/pokemon_held_item_version_entity.dart';

class PokemonHeldItemVersion extends PokemonHeldItemVersionEntity {
  PokemonHeldItemVersion({
    required rarity,
    required version,
  }) : super(
          rarity: rarity,
          version: version,
        );

  factory PokemonHeldItemVersion.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonHeldItemVersion(
      rarity: parsedJson['rarity'],
      version: Version.fromJson(parsedJson['version']),
    );
  }
}
