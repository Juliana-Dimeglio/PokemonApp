import '../../../core/util/call_enum.dart';
import '../../../data/model/pokemon.dart';
import '../../../data/repository/repository_impl.dart';
import '../use_case_interface.dart';

class GetEvolutionsUseCase implements UseCase<Pokemon> {
  GetEvolutionsUseCase({
    required this.name,
  });

  final String name;
  final PokemonRepository _pokemonRepository = PokemonRepository();

  @override
  Future<Pokemon> evolutionCall() async {
    return await _pokemonRepository.fetchPokemonByName(name);
  }

  @override
  Future<Pokemon> call(Call callType, [String? url]) {
    throw UnimplementedError();
  }
}
