import '../../data/model/pokemon_stat.dart';
import '../../data/model/pokemon_sprites.dart';
import '../../data/model/pokemon_types.dart';
import '../../data/model/pokemon_species.dart';
import '../../data/model/pokemon_move.dart';
import '../../data/model/pokemon_abilities.dart';
import '../../data/model/pokemon_form.dart';
import '../../data/model/pokemon_game_indices.dart';
import '../../data/model/pokemon_held_items.dart';
import '../../data/model/pokemon_past_types.dart';

class PokemonEntity {
  PokemonEntity({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  final List<PokemonAbilities> abilities;
  final int baseExperience;
  final List<PokemonForm> forms;
  final List<PokemonGameIndices> gameIndices;
  final int height;
  final List<PokemonHeldItems> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<PokemonMove> moves;
  final String name;
  final int order;
  final List<PokemonPastTypes> pastTypes;
  final PokemonSpecies species;
  final PokemonSprites sprites;
  final List<PokemonStat> stats;
  final List<PokemonTypes> types;
  final int weight;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'abilities': abilities.map((e) => e.toJson()).toList(),
      'base_experience': baseExperience,
      'forms': forms.map((e) => e.toJson()).toList(),
      'game_indices': gameIndices.map((e) => e.toJson()).toList(),
      'height': height,
      'held_items': heldItems.map((e) => e.toJson()).toList(),
      'id': id,
      'is_default': isDefault,
      'location_area_encounters': locationAreaEncounters,
      'moves': moves.map((e) => e.toJson()).toList(),
      'name': name,
      'order': order,
      'past_types': pastTypes.map((e) => e.toJson()).toList(),
      'species': species.toJson(),
      'sprites': sprites.toJson(),
      'stats': stats.map((e) => e.toJson()).toList(),
      'types': types.map((e) => e.toJson()).toList(),
      'weight': weight,
    };
  }
}
