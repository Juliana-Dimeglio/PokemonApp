import '../../../core/util/call_enum.dart';
import '../../../data/model/pokemon_response.dart';
import '../../../data/datasource/local/DAOs/pokemon_database.dart';
import '../../../data/repository/repository_impl.dart';
import '../use_case_interface.dart';

class GetPokemonsUseCase implements UseCase<PokemonResponse?> {
  GetPokemonsUseCase();

  final PokemonDatabase _pokemonDatabase = PokemonDatabase();
  final PokemonRepository _pokemonRepository = PokemonRepository();

  @override
  Future<PokemonResponse?> call(Call callType, [String? url]) async {
    final PokemonResponse? pokemonList =
        await _pokemonRepository.fetchAllPokemons(
      callType,
      url,
    );
    if (pokemonList?.pokemonResults.isNotEmpty == true &&
        callType == Call.fetchPokemon) {
      await _pokemonDatabase.clearDatabase();
      await _pokemonDatabase.addPokemonToFirebase(
        pokemonList!.pokemonResults,
      );
    }
    return pokemonList;
  }

  @override
  Future<PokemonResponse?> evolutionCall() {
    throw UnimplementedError();
  }
}
