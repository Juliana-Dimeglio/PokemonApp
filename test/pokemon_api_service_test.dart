import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/src/core/util/call_enum.dart';
import 'package:pokemon_app/src/data/datasource/remote/pokemon_api_service.dart';
import 'package:pokemon_app/src/data/model/pokemon_response.dart';

void main() {
  late PokemonApiService pokemonApiService;

  setUp(() {
    pokemonApiService = PokemonApiService();
  });

  test('Testing pokemon api service', () async {
    PokemonResponse? fetchResult =
        await pokemonApiService.fetchPokemonList(Call.fetchPokemon);
    expect(fetchResult, isA<PokemonResponse>());
    expect(fetchResult!.pokemonResults.length, 20);
  });

  test('Testing fetching page pokemon api service', () async {
    PokemonResponse? fetchResult = await pokemonApiService.fetchPokemonList(
      Call.directionPage,
      'https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20',
    );
    expect(fetchResult, isA<PokemonResponse>());
    expect(fetchResult!.pokemonResults.length, 20);
  });
}
