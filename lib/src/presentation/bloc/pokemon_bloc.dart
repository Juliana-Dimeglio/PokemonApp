import 'dart:async';
import '../../domain/usecase/implementation/use_case_impl.dart';
import 'i_pokemon_bloc.dart';
import '../../data/model/pokemon.dart';

class PokemonBloc extends IPokemonBloc {
  PokemonBloc();

  final GetPokemonsUseCase _pokemonUseCase = GetPokemonsUseCase();
  final _pokemonFetcher = StreamController<List<Pokemon>>();

  Stream<List<Pokemon>> get allPokemonsStream => _pokemonFetcher.stream;

  @override
  void fetchAllPokemons() async {
    List<Pokemon> pokemonList = await _pokemonUseCase.call();
    _pokemonFetcher.sink.add(pokemonList);
  }

  @override
  void initialize() {}

  @override
  void dispose() {
    _pokemonFetcher.close();
  }
}
