import 'dart:async';
import '../../domain/usecase/implementation/use_case_impl.dart';

import 'i_pokemon_bloc.dart';
import '../../data/model/pokemon.dart';

class PokemonBloc extends IPokemonBloc {
  PokemonBloc();

  late GetPokemonsUseCase _pokemonUseCase;
  final _pokemonFetcher = StreamController<List<Pokemon>>.broadcast();

  Stream<List<Pokemon>> get allPokemonsStream => _pokemonFetcher.stream;

  @override
  void fetchAllPokemons() async {
    List<Pokemon> pokemonModel = await _pokemonUseCase.call();
    _pokemonFetcher.sink.add(pokemonModel);
  }

  @override
  Future<void> initialize() async {
    _pokemonUseCase = GetPokemonsUseCase();
  }

  @override
  void dispose() {
    _pokemonFetcher.close();
  }
}
