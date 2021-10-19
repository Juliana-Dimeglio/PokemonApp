import '../../data/model/version.dart';

class PokemonHeldItemVersionEntity {
  PokemonHeldItemVersionEntity({
    required this.rarity,
    required this.version,
  });

  final int rarity;
  final Version version;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'rarity': rarity,
      'version': version.toJson(),
    };
  }
}
