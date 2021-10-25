import 'chain.dart';
import '../../../domain/entity/species_entity/evolution_response_entity.dart';

class EvolutionResponse extends EvolutionResponseEntity {
  EvolutionResponse({
    required Chain evolvesTo,
  }) : super(
          evolvesTo: evolvesTo,
        );

  factory EvolutionResponse.fromJson(Map<String, dynamic> parsedJson) {
    return EvolutionResponse(
      evolvesTo: Chain.fromJson(
        parsedJson['chain'],
      ),
    );
  }
}
