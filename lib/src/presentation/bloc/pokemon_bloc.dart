import 'dart:async';
import '../../core/util/string_constants.dart';
import '../../core/util/call_enum.dart';
import '../../data/model/pokemon_response.dart';
import '../../domain/usecase/implementation/use_case_impl.dart';
import 'i_pokemon_bloc.dart';
import 'model/state_model.dart';

class PokemonBloc extends IPokemonBloc {
  PokemonBloc();

  final GetPokemonsUseCase _getPokemonsUseCase = GetPokemonsUseCase();
  final _pokemonFetcher = StreamController<StateModel>.broadcast();
  late String nextPage;
  late String previousPage;

  Stream<StateModel> get allPokemonsStream => _pokemonFetcher.stream;

  @override
  void initialize() {
    _pokemonFetcher.stream.listen((stateModel) {
      nextPage = stateModel.response?.next ?? StringConstants.emptyString;
      previousPage =
          stateModel.response?.previous ?? StringConstants.emptyString;
    });
  }

  @override
  void dispose() {
    _pokemonFetcher.close();
  }

  @override
  void fetchAllPokemons(Call callType, [String? url]) async {
    _pokemonFetcher.sink.add(
      StateModel(
        state: StateType.loading,
      ),
    );
    PokemonResponse? pokemonResponse = await _getPokemonsUseCase.call(
      callType,
      url,
    );
    if (pokemonResponse != null) {
      _pokemonFetcher.sink.add(
        StateModel(
          state: StateType.success,
          response: pokemonResponse,
        ),
      );
    }
  }

  void getPreviousPage() {
    if (previousPage.isNotEmpty) {
      fetchAllPokemons(
        Call.directionPage,
        previousPage,
      );
    }
  }

  void getNextPage() {
    if (nextPage.isNotEmpty) {
      fetchAllPokemons(
        Call.directionPage,
        nextPage,
      );
    }
  }
}
