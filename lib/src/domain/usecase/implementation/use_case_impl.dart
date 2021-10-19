import '../../../data/datasource/local/DAOs/pokemon_database.dart';
import '../../../data/model/pokemon.dart';
import '../../../data/repository/repository_impl.dart';
import '../use_case_interface.dart';

class GetPokemonsUseCase implements UseCase<List<Pokemon>> {
  GetPokemonsUseCase();

  final PokemonDatabase _pokemonDatabase = PokemonDatabase.singleton;
  final PokemonRepository _pokemonRepository = PokemonRepository();

  @override
  Future<List<Pokemon>> call() async {
    final List<Pokemon> pokemonList =
        await _pokemonRepository.fetchAllPokemons();
    if (pokemonList.isNotEmpty) {
      await _pokemonDatabase.clearDatabase();
      await _pokemonDatabase.addPokemonToFirebase(pokemonList);
    }
    return _pokemonDatabase.fetchPokemonList();
  }
}
