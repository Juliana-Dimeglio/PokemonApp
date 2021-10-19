import '../../domain/entity/version_group_entity.dart';

class VersionGroup extends VersionGroupEntity {
  VersionGroup({
    required name,
    required url,
  }) : super(
          name: name,
          url: url,
        );

  factory VersionGroup.fromJson(Map<String, dynamic> parsedJson) {
    return VersionGroup(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
