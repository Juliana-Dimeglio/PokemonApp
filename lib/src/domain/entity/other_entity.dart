import '../../data/model/official_artwork.dart';
import '../../data/model/dream_world.dart';

class OtherEntity {
  OtherEntity({
    required this.dreamWorld,
    required this.officialArtwork,
  });

  final DreamWorld dreamWorld;
  final OfficialArtwork officialArtwork;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'dream_world': dreamWorld.toJson(),
      'official-artwork': officialArtwork.toJson(),
    };
  }
}
