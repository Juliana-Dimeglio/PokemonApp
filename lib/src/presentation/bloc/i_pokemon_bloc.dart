import '../../core/bloc/bloc.dart';

abstract class IPokemonBloc extends IBloc {
  void fetchAllPokemons() {}
}
