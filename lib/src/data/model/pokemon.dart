import 'pokemon_species.dart';
import 'pokemon_sprites.dart';
import 'pokemon_abilities.dart';
import 'pokemon_form.dart';
import 'pokemon_game_indices.dart';
import 'pokemon_held_items.dart';
import 'pokemon_move.dart';
import 'pokemon_past_types.dart';
import 'pokemon_stat.dart';
import 'pokemon_types.dart';
import '../../domain/entity/pokemon_entity.dart';

class Pokemon extends PokemonEntity {
  Pokemon({
    required abilities,
    required baseExperience,
    required forms,
    required gameIndices,
    required height,
    required heldItems,
    required id,
    required isDefault,
    required locationAreaEncounters,
    required moves,
    required name,
    required order,
    required pastTypes,
    required species,
    required sprites,
    required stats,
    required types,
    required weight,
  }) : super(
          abilities: abilities,
          baseExperience: baseExperience,
          forms: forms,
          gameIndices: gameIndices,
          height: height,
          heldItems: heldItems,
          id: id,
          isDefault: isDefault,
          locationAreaEncounters: locationAreaEncounters,
          moves: moves,
          name: name,
          order: order,
          pastTypes: pastTypes,
          species: species,
          sprites: sprites,
          stats: stats,
          types: types,
          weight: weight,
        );

  factory Pokemon.fromJson(Map<String, dynamic> parsedJson) {
    var formsJsonList = parsedJson['forms'] as List<dynamic>;
    var formsList = <PokemonForm>[];
    formsList = formsJsonList.map((i) => PokemonForm.fromJson(i)).toList();

    var abilitiesJsonList = parsedJson['abilities'] as List<dynamic>;
    var abilitiesList = <PokemonAbilities>[];
    abilitiesList =
        abilitiesJsonList.map((i) => PokemonAbilities.fromJson(i)).toList();

    var gameIndicesJsonList = parsedJson['game_indices'] as List<dynamic>;
    var gameIndicesList = <PokemonGameIndices>[];
    gameIndicesList =
        gameIndicesJsonList.map((i) => PokemonGameIndices.fromJson(i)).toList();

    var heldItemsJsonList = parsedJson['held_items'] as List<dynamic>;
    var heldItemsList = <PokemonHeldItems>[];
    if (heldItemsJsonList.isNotEmpty) {
      heldItemsList =
          heldItemsJsonList.map((i) => PokemonHeldItems.fromJson(i)).toList();
    }
    var movesJsonList = parsedJson['moves'] as List<dynamic>;
    var movesList = <PokemonMove>[];
    movesList = movesJsonList.map((i) => PokemonMove.fromJson(i)).toList();

    var pastTypesJsonList = parsedJson['past_types'] as List<dynamic>;
    var pastTypesList = <PokemonPastTypes>[];
    if (pastTypesJsonList.isNotEmpty) {
      pastTypesList =
          pastTypesJsonList.map((i) => PokemonPastTypes.fromJson(i)).toList();
    }
    var typesJsonList = parsedJson['types'] as List<dynamic>;
    var typesList = <PokemonTypes>[];
    typesList = typesJsonList.map((i) => PokemonTypes.fromJson(i)).toList();

    var statJsonList = parsedJson['stats'] as List<dynamic>;
    var statList = <PokemonStat>[];
    statList = statJsonList.map((i) => PokemonStat.fromJson(i)).toList();

    return Pokemon(
      abilities: abilitiesList,
      baseExperience: parsedJson['base_experience'],
      forms: formsList,
      gameIndices: gameIndicesList,
      height: parsedJson['height'],
      heldItems: heldItemsList,
      id: parsedJson['id'],
      isDefault: parsedJson['is_default'],
      locationAreaEncounters: parsedJson['location_area_encounters'],
      moves: movesList,
      name: parsedJson['name'],
      order: parsedJson['order'],
      pastTypes: pastTypesList,
      species: PokemonSpecies.fromJson(
        parsedJson['species'],
      ),
      sprites: PokemonSprites.fromJson(
        parsedJson['sprites'],
      ),
      stats: statList,
      types: typesList,
      weight: parsedJson['weight'],
    );
  }
}
