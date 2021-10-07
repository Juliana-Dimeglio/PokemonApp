import '../../domain/entity/pokemon_move_entity.dart';

import 'move.dart';
import 'pokemon_move_version.dart';

class PokemonMove extends PokemonMoveEntity {
  PokemonMove({
    required move,
    required versionGroupDetails,
  }) : super(
          move: move,
          versionGroupDetails: versionGroupDetails,
        );

  factory PokemonMove.fromJson(Map<String, dynamic> parsedJson) {
    var versionGroupDetailsJsonList =
        parsedJson['version_group_details'] as List<dynamic>;
    var versionGroupDetailsList = <PokemonMoveVersion>[];
    versionGroupDetailsList = versionGroupDetailsJsonList
        .map((i) => PokemonMoveVersion.fromJson(i))
        .toList();

    return PokemonMove(
      move: Move.fromJson(parsedJson['move']),
      versionGroupDetails: versionGroupDetailsList,
    );
  }
}
