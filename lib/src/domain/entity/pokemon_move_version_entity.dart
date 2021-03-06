import '../../data/model/version_group.dart';
import '../../data/model/move_learn_method.dart';

class PokemonMoveVersionEntity {
  PokemonMoveVersionEntity({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  final int levelLearnedAt;
  final MoveLearnMethod moveLearnMethod;
  final VersionGroup versionGroup;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'level_learned_at': levelLearnedAt,
      'move_learn_method': moveLearnMethod.toJson(),
      'version_group': versionGroup.toJson(),
    };
  }
}
