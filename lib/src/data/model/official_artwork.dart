import '../../domain/entity/official_artwork_entity.dart';

class OfficialArtwork extends OfficialArtworkEntity {
  OfficialArtwork({
    required frontDefault,
  }) : super(
          frontDefault: frontDefault,
        );

  factory OfficialArtwork.fromJson(Map<String, dynamic> parsedJson) {
    return OfficialArtwork(
      frontDefault: parsedJson['front_default'],
    );
  }
}
