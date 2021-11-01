import 'dart:async';
import 'package:flutter/cupertino.dart';
import '../../core/util/call_enum.dart';
import '../../data/model/pokemon_response.dart';
import '../../domain/usecase/implementation/use_case_impl.dart';
import 'i_pokemon_bloc.dart';

class PokemonBloc extends IPokemonBloc {
  PokemonBloc();

  final GetPokemonsUseCase _getPokemonsUseCase = GetPokemonsUseCase();
  final _pokemonFetcher = StreamController<PokemonResponse?>.broadcast();
  late String nextPage;
  late String previousPage;

  Stream<PokemonResponse?> get allPokemonsStream => _pokemonFetcher.stream;

  @override
  void initialize() {
    _pokemonFetcher.stream.listen((pokemonResponse) {
      nextPage = pokemonResponse?.next ?? '';
      previousPage = pokemonResponse?.previous ?? '';
    });
  }

  @override
  void dispose() {
    _pokemonFetcher.close();
  }

  @override
  void fetchAllPokemons(Call callType, [String? url]) async {
    PokemonResponse? pokemonResponse = await _getPokemonsUseCase.call(
      callType,
      url,
    );
    _pokemonFetcher.sink.add(pokemonResponse);
  }

  void pageChange(
    double currentPage,
    PageController _controller,
  ) {
    if (currentPage < _controller.page!) {
      if (nextPage.isNotEmpty) {
        fetchAllPokemons(
          Call.directionPage,
          nextPage,
        );
      }
    } else {
      if (previousPage.isNotEmpty) {
        fetchAllPokemons(
          Call.directionPage,
          previousPage,
        );
      }
    }
  }
}
