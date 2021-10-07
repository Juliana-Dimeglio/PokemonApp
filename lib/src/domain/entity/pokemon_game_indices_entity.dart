import 'version_entity.dart';

class PokemonGameIndicesEntity {
  PokemonGameIndicesEntity({
    required this.gameIndex,
    required this.version,
  });

  final int gameIndex;
  final VersionEntity? version;
}
