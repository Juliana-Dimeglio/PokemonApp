import '../../domain/entity/dream_world_entity.dart';

class DreamWorld extends DreamWorldEntity {
  DreamWorld({
    required frontDefault,
    required frontFemale,
  }) : super(
          frontDefault: frontDefault,
          frontFemale: frontFemale,
        );

  factory DreamWorld.fromJson(Map<String, dynamic> parsedJson) {
    return DreamWorld(
      frontFemale: parsedJson['front_female'],
      frontDefault: parsedJson['front_default'],
    );
  }
}
