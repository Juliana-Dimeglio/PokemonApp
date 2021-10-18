import '../../data/model/pokemon_type.dart';

class PokemonTypesEntity {
  PokemonTypesEntity({
    required this.slot,
    required this.type,
  });

  final int slot;
  final PokemonType type;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'slot': slot,
      'type': type.toJson(),
    };
  }
}
