import '../../../data/model/pokemon.dart';
import '../../../data/repository/repository_impl.dart';

import '../use_case_interface.dart';

class GetPokemonsUseCase implements UseCase<List<Pokemon>> {
  GetPokemonsUseCase();

  final PokemonRepository _pokemonRepository = PokemonRepository();

  @override
  Future<List<Pokemon>> call() {
    return _pokemonRepository.fetchAllPokemons();
  }
}
