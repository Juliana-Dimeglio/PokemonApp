import '../../data/model/official_artwork.dart';
import '../../data/model/dream_world.dart';

class OtherEntity {
  OtherEntity({
    required this.dreamWorld,
    required this.officialArtwork,
  });

  final DreamWorld dreamWorld;
  final OfficialArtwork officialArtwork;
}
