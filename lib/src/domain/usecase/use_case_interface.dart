import '../../core/util/call_enum.dart';

abstract class UseCase<T> {
  Future<T> call(Call callType, [String? url]);

  Future<T> evolutionCall();
}
