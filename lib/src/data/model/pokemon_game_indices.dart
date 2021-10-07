import 'version.dart';

import '../../domain/entity/pokemon_game_indices_entity.dart';

class PokemonGameIndices extends PokemonGameIndicesEntity {
  PokemonGameIndices({
    required gameIndex,
    required version,
  }) : super(
          gameIndex: gameIndex,
          version: version,
        );

  factory PokemonGameIndices.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonGameIndices(
      gameIndex: parsedJson['game_index'],
      version: Version.fromJson(parsedJson['version']),
    );
  }
}
