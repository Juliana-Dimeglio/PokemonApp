import '../../core/util/call_enum.dart';
import '../../data/model/pokemon_response.dart';
import '../../data/model/pokemon.dart';

abstract class IPokemonRepository {
  Future<PokemonResponse?> fetchAllPokemons(Call callType, [String? url]);

  Future<Pokemon> fetchPokemonByName(String name);
}
