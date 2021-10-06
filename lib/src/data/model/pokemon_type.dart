import '../../domain/entity/pokemon_type_entity.dart';

class PokemonType extends PokemonTypeEntity {
  PokemonType({
    required name,
    required url,
  }) : super(
          name: name,
          url: url,
        );

  factory PokemonType.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonType(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
