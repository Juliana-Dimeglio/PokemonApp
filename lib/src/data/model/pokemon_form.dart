import '../../domain/entity/pokemon_form_entity.dart';

class PokemonForm extends PokemonFormEntity {
  PokemonForm({
    required name,
    required url,
  }) : super(
          name: name,
          url: url,
        );

  factory PokemonForm.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonForm(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
