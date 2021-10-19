class OfficialArtworkEntity {
  OfficialArtworkEntity({
    required this.frontDefault,
  });

  final String frontDefault;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'front_default': frontDefault,
    };
  }
}
