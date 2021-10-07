import 'item.dart';

import '../../domain/entity/pokemon_held_items_entity.dart';
import 'pokemon_held_item_version.dart';

class PokemonHeldItems extends PokemonHeldItemsEntity {
  PokemonHeldItems({
    required item,
    required versionDetail,
  }) : super(
          item: item,
          versionDetails: versionDetail,
        );

  factory PokemonHeldItems.fromJson(Map<String, dynamic> parsedJson) {
    var versionDetailsJsonList = parsedJson['version_details'] as List<dynamic>;
    var versionDetailsList = <PokemonHeldItemVersion>[];
    versionDetailsList = versionDetailsJsonList
        .map((i) => PokemonHeldItemVersion.fromJson(i))
        .toList();

    return PokemonHeldItems(
      item: Item.fromJson(
        parsedJson['item'],
      ),
      versionDetail: versionDetailsList,
    );
  }
}
