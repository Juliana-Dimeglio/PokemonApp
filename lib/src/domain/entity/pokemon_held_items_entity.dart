import '../../data/model/pokemon_held_item_version.dart';

import '../../data/model/item.dart';

class PokemonHeldItemsEntity {
  PokemonHeldItemsEntity({
    required this.item,
    required this.versionDetails,
  });

  final Item item;
  final List<PokemonHeldItemVersion> versionDetails;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'item': item.toJson(),
      'version_details': versionDetails.map((e) => e.toJson()).toList(),
    };
  }
}
