class DreamWorldEntity {
  DreamWorldEntity({
    required this.frontDefault,
    required this.frontFemale,
  });

  final String frontDefault;
  final String? frontFemale;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'front_default': frontDefault,
      'front_female': frontFemale,
    };
  }
}
