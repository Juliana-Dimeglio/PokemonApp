import '../../domain/entity/item_entity.dart';

class Item extends ItemEntity {
  Item({
    required name,
    required url,
  }) : super(
          name: name,
          url: url,
        );

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
