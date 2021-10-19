import 'move_learn_method.dart';
import 'version_group.dart';

import '../../domain/entity/pokemon_move_version_entity.dart';

class PokemonMoveVersion extends PokemonMoveVersionEntity {
  PokemonMoveVersion({
    required levelLearnedAt,
    required moveLearnMethod,
    required versionGroup,
  }) : super(
          levelLearnedAt: levelLearnedAt,
          moveLearnMethod: moveLearnMethod,
          versionGroup: versionGroup,
        );

  factory PokemonMoveVersion.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonMoveVersion(
      levelLearnedAt: parsedJson['level_learned_at'],
      moveLearnMethod: MoveLearnMethod.fromJson(
        parsedJson['move_learn_method'],
      ),
      versionGroup: VersionGroup.fromJson(
        parsedJson['version_group'],
      ),
    );
  }
}
