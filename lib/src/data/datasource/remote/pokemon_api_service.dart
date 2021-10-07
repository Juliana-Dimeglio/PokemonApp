import 'dart:convert';
import 'package:http/http.dart';
import '../../../core/util/string_constants.dart';
import '../../../core/util/numeric_constants.dart';
import '../../model/pokemon_response.dart';
import '../../model/pokemon.dart';

class PokemonApiService {
  Client client = Client();

  Future<List<Pokemon>> fetchPokemonList() async {
    final response = await client.get(
      Uri.parse(StringConstants.apiUrl),
    );
    if (response.statusCode == NumericConstants.statusCode) {
      var pokemonResponse =
          PokemonResponse.fromJson(json.decode(response.body));
      var pokemonResponseJsonList = pokemonResponse.results;
      var pokemonList = <Pokemon>[];
      for (var i = 0; i < pokemonResponseJsonList.length; i++) {
        pokemonList
            .add(await fetchPokemonByIdList(pokemonResponseJsonList[i].url));
      }
      return pokemonList;
    } else {
      throw Exception(StringConstants.exceptionTextPokemonList);
    }
  }

  Future<Pokemon> fetchPokemonByIdList(String url) async {
    final response = await client.get(
      Uri.parse(url),
    );
    if (response.statusCode == NumericConstants.statusCode) {
      return Pokemon.fromJson(json.decode(response.body));
    } else {
      throw Exception(StringConstants.exceptionTextPokemon);
    }
  }
}