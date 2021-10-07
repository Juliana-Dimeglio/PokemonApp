import '../../data/model/pokemon_move_version.dart';

import '../../data/model/move.dart';

class PokemonMoveEntity {
  PokemonMoveEntity({
    required this.move,
    required this.versionGroupDetails,
  });

  final Move move;
  final List<PokemonMoveVersion> versionGroupDetails;
}
