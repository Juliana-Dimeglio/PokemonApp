import '../../domain/entity/ability_entity.dart';

class Ability extends AbilityEntity {
  Ability({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory Ability.fromJson(Map<String, dynamic> parsedJson) {
    return Ability(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
