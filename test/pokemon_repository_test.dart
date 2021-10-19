import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/src/data/model/pokemon.dart';
import 'package:pokemon_app/src/data/repository/repository_impl.dart';

void main() {
  late PokemonRepository pokemonRepository;
  setUp(() {
    pokemonRepository = PokemonRepository();
  });
  test('Testing pokemon repository', () async {
    List<Pokemon> fetchAllPokemonsResult =
        await pokemonRepository.fetchAllPokemons();
    expect(fetchAllPokemonsResult, isA<List<Pokemon>>());
    expect(fetchAllPokemonsResult.length, 20);
  });
}
