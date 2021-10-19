import '../../domain/entity/move_learn_method_entity.dart';

class MoveLearnMethod extends MoveLearnMethodEntity {
  MoveLearnMethod({
    required name,
    required url,
  }) : super(
          name: name,
          url: url,
        );

  factory MoveLearnMethod.fromJson(Map<String, dynamic> parsedJson) {
    return MoveLearnMethod(
      name: parsedJson['name'],
      url: parsedJson['url'],
    );
  }
}
