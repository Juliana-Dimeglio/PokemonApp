import '../../../data/model/pokemon_response.dart';

class StateModel {
  StateModel({
    required this.state,
    this.response,
  });

  final StateType state;
  final PokemonResponse? response;
}

enum StateType {
  splashScreen,
  loading,
  success,
  error,
}
