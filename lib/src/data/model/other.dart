import 'dream_world.dart';
import 'official_artwork.dart';
import '../../domain/entity/other_entity.dart';

class Other extends OtherEntity {
  Other({
    required dreamWorld,
    required officialArtwork,
  }) : super(
          dreamWorld: dreamWorld,
          officialArtwork: officialArtwork,
        );

  factory Other.fromJson(Map<String, dynamic> parsedJson) {
    return Other(
      dreamWorld: DreamWorld.fromJson(
        parsedJson['dream_world'],
      ),
      officialArtwork: OfficialArtwork.fromJson(
        parsedJson['official-artwork'],
      ),
    );
  }
}
