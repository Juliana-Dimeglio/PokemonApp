import '../../data/model/pokemon_move_version.dart';
import '../../data/model/move.dart';

class PokemonMoveEntity {
  PokemonMoveEntity({
    required this.move,
    required this.versionGroupDetails,
  });

  final Move move;
  final List<PokemonMoveVersion> versionGroupDetails;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'move': move.toJson(),
      'version_group_details':
          versionGroupDetails.map((e) => e.toJson()).toList(),
    };
  }
}
