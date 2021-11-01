import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/src/core/util/call_enum.dart';
import 'package:pokemon_app/src/data/model/pokemon_response.dart';
import 'package:pokemon_app/src/data/repository/repository_impl.dart';

void main() {
  late PokemonRepository pokemonRepository;
  setUp(() {
    pokemonRepository = PokemonRepository();
  });
  test('Testing pokemon repository', () async {
    PokemonResponse? fetchAllPokemonsResult =
    await pokemonRepository.fetchAllPokemons(
      Call.fetchPokemon,
    );
    expect(fetchAllPokemonsResult, isA<PokemonResponse>());
    expect(fetchAllPokemonsResult!.pokemonResults.length, 20);
  });
  test('Testing fetch pokemon page repository', () async {
    PokemonResponse? fetchAllPokemonsResult =
    await pokemonRepository.fetchAllPokemons(
      Call.directionPage
      'https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20',
    );
    expect(fetchAllPokemonsResult, isA<PokemonResponse?>());
    expect(fetchAllPokemonsResult!.pokemonResults.length, 20);
  });
}
