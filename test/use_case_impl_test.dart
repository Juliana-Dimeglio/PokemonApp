import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/src/data/model/pokemon.dart';
import 'package:pokemon_app/src/domain/usecase/implementation/use_case_impl.dart';

void main() {
  late GetPokemonsUseCase getPokemonsUseCase;
  setUp(() {
    getPokemonsUseCase = GetPokemonsUseCase();
  });
  test('testing pokemon use case', () async {
    List<Pokemon> callResult = await getPokemonsUseCase.call();
    expect(callResult, isA<List<Pokemon>>());
    expect(callResult.length, 20);
  });
}
