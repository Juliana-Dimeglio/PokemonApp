import '../../../data/model/species_response/chain.dart';

class EvolutionResponseEntity {
  EvolutionResponseEntity({
    required this.evolvesTo,
  });

  final Chain evolvesTo;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': evolvesTo,
    };
  }
}
