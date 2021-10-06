import '../../data/model/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> fetchAllPokemons();
}
