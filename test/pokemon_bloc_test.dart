import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/src/data/model/pokemon.dart';
import 'package:pokemon_app/src/presentation/bloc/pokemon_bloc.dart';

void main() {
  late PokemonBloc pokemonBloc;
  setUp(() {
    pokemonBloc = PokemonBloc();
  });
  test('Testing pokemon BLOC', () async {
    pokemonBloc.initialize();
    pokemonBloc.fetchAllPokemons();
    expect(pokemonBloc.allPokemonsStream, emits(isA<List<Pokemon>>()));
    pokemonBloc.allPokemonsStream.listen(expectAsync1((event) {
      expect(event, isInstanceOf<List<Pokemon>>());
    }));
  });
}
