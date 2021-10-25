import '../datasource/remote/pokemon_api_service.dart';
import '../model/pokemon.dart';
import '../../domain/repository/repository_interface.dart';

class PokemonRepository extends IPokemonRepository {
  final pokemonApiService = PokemonApiService();

  Future<List<Pokemon>> fetchAllPokemons() =>
      pokemonApiService.fetchPokemonList();

  Future<Pokemon> fetchPokemonByName(String name) =>
      pokemonApiService.fetchPokemonByName(name);
}
