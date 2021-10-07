import '../../data/model/pokemon_held_item_version.dart';

import '../../data/model/item.dart';

class PokemonHeldItemsEntity {
  PokemonHeldItemsEntity({
    required this.item,
    required this.versionDetails,
  });

  final Item item;
  final List<PokemonHeldItemVersion> versionDetails;
}
