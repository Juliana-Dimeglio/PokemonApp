import '../../domain/entity/move_entity.dart';

class Move extends MoveEntity {
  Move({
    required name,
    required url,
  }) : super(
          name: name,
          url: url,
        );

  factory Move.fromJson(Map<String, dynamic> parsedJson) {
    return Move(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
