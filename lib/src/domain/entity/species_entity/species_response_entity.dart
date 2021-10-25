class SpeciesResponseEntity {
  SpeciesResponseEntity({
    required this.evolutionChainUrl,
  });

  final String evolutionChainUrl;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': evolutionChainUrl,
    };
  }
}
