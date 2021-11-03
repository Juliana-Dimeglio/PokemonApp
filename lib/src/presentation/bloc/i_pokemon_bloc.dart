import '../../core/util/call_enum.dart';
import '../../core/bloc/bloc.dart';

abstract class IPokemonBloc extends IBloc {
  void fetchAllPokemons(Call callType, [String? url]) {}

  void initialize() {}

  void dispose() {}
}
