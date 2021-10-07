import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/src/data/datasource/remote/pokemon_api_service.dart';
import 'package:pokemon_app/src/data/model/pokemon.dart';

void main() {
  late PokemonApiService pokemonApiService;

  setUp(() {
    pokemonApiService = PokemonApiService();
  });
  test('Testing pokemon api service', () async {
    List<Pokemon> fetchResult = await pokemonApiService.fetchPokemonList();
    expect(fetchResult, isA<List<Pokemon>>());
    expect(fetchResult.length, 20);
  });
}
