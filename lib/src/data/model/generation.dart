import '../../domain/entity/generation_entity.dart';

class Generation extends GenerationEntity {
  Generation({
    required name,
    required url,
  }) : super(
          name: name,
          url: url,
        );

  factory Generation.fromJson(Map<String, dynamic> parsedJson) {
    return Generation(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
