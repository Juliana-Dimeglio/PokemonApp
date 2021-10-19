import '../../domain/entity/stat_entity.dart';

class Stat extends StatEntity {
  Stat({
    required name,
    required url,
  }) : super(name: name, url: url);

  factory Stat.fromJson(Map<String, dynamic> parsedJson) {
    return Stat(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
