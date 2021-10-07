import '../../domain/entity/pokemon_sprites_entity.dart';
import 'other.dart';

class PokemonSprites extends PokemonSpritesEntity {
  PokemonSprites({
    required backDefault,
    required backFemale,
    required backShiny,
    required backShinyFemale,
    required frontDefault,
    required frontFemale,
    required frontShiny,
    required frontShinyFemale,
    required other,
  }) : super(
          backDefault: backDefault,
          backFemale: backFemale,
          backShiny: backShiny,
          backShinyFemale: backShinyFemale,
          frontDefault: frontDefault,
          frontFemale: frontFemale,
          frontShiny: frontShiny,
          frontShinyFemale: frontShinyFemale,
          other: other,
        );

  factory PokemonSprites.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonSprites(
      backDefault: parsedJson['back_default'],
      backFemale: parsedJson['back_female'],
      backShiny: parsedJson['back_shiny'],
      backShinyFemale: parsedJson['back_shiny_female'],
      frontDefault: parsedJson['front_default'],
      frontFemale: parsedJson['front_female'],
      frontShiny: parsedJson['front_shiny'],
      frontShinyFemale: parsedJson['front_shiny_female'],
      other: Other.fromJson(parsedJson['other']),
    );
  }
}
