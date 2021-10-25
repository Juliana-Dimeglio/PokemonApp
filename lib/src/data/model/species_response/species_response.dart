import '../../../domain/entity/species_entity/species_response_entity.dart';

class SpeciesResponse extends SpeciesResponseEntity {
  SpeciesResponse({
    required evolutionChainUrl,
  }) : super(
          evolutionChainUrl: evolutionChainUrl,
        );

  factory SpeciesResponse.fromJson(Map<String, dynamic> parsedJson) {
    return SpeciesResponse(
      evolutionChainUrl: parsedJson['evolution_chain']['url'],
    );
  }
}
