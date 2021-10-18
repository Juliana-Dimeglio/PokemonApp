import 'version_entity.dart';

class PokemonGameIndicesEntity {
  PokemonGameIndicesEntity({
    required this.gameIndex,
    required this.version,
  });

  final int gameIndex;
  final VersionEntity? version;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'game_index': gameIndex,
      'version': version!.toJson(),
    };
  }
}
