import '../../core/util/call_enum.dart';
import '../model/pokemon_response.dart';
import '../datasource/remote/pokemon_api_service.dart';
import '../model/pokemon.dart';
import '../../domain/repository/repository_interface.dart';

class PokemonRepository extends IPokemonRepository {
  final pokemonApiService = PokemonApiService();

  @override
  Future<PokemonResponse?> fetchAllPokemons(Call callType, [String? url]) =>
      pokemonApiService.fetchPokemonList(
        callType,
        url,
      );

  Future<Pokemon> fetchPokemonByName(String name) =>
      pokemonApiService.fetchPokemonByName(name);
}
