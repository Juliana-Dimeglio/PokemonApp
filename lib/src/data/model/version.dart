import '../../domain/entity/version_entity.dart';

class Version extends VersionEntity {
  Version({
    required name,
    required url,
  }) : super(
          name: name,
          url: url,
        );

  factory Version.fromJson(Map<String, dynamic> parsedJson) {
    return Version(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
