import 'dart:convert';
import 'package:http/http.dart';
import '../../../core/util/call_enum.dart';
import '../../model/species_response/chain.dart';
import '../../model/species_response/evolution_response.dart';
import '../../model/species_response/species_response.dart';
import '../../../core/util/string_constants.dart';
import '../../../core/util/numeric_constants.dart';
import '../../model/pokemon_response.dart';
import '../../model/pokemon.dart';

class PokemonApiService {
  Client client = Client();

  Future<String> _getEvolvesTo(Pokemon pokemon) async {
    var speciesResponse = await getNextEvolution(pokemon.species.url);
    var evolvesTo = await _getNextEvolutionName(
      speciesResponse.evolutionChainUrl,
      pokemon.name,
    );
    return evolvesTo;
  }

  Future<PokemonResponse?> fetchPokemonList(Call callType,
      [String? url]) async {
    var pokemonList = <Pokemon>[];
    PokemonResponse? pokemonResponse;
    try {
      var _url = '';
      switch (callType) {
        case Call.fetchPokemon:
          _url = StringConstants.apiUrl;
          break;
        case Call.directionPage:
          _url = url ?? '';
          break;
      }
      final response = await client.get(
        Uri.parse(
          _url,
        ),
      );
      if (response.statusCode == NumericConstants.statusCode) {
        pokemonResponse = PokemonResponse.fromJson(
          json.decode(
            response.body,
          ),
        );
        var pokemonResponseJsonList = pokemonResponse.results;
        for (var i = 0; i < pokemonResponseJsonList.length; i++) {
          var pokemon = await fetchPokemonByIdList(
            pokemonResponseJsonList[i].url,
          );
          var evolvesTo = await _getEvolvesTo(pokemon);
          pokemonList.add(
            pokemon.copyWith(evolvesTo: evolvesTo),
          );
        }
        pokemonResponse.pokemonResults.addAll(pokemonList);
      }
    } catch (e) {}
    return pokemonResponse;
  }

  Future<Pokemon> fetchPokemonByIdList(String url) async {
    final response = await client.get(
      Uri.parse(url),
    );
    if (response.statusCode == NumericConstants.statusCode) {
      return Pokemon.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else {
      throw Exception(StringConstants.exceptionTextPokemon);
    }
  }

  Future<SpeciesResponse> getNextEvolution(String url) async {
    final response = await client.get(
      Uri.parse(url),
    );
    if (response.statusCode == NumericConstants.statusCode) {
      return SpeciesResponse.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else {
      throw Exception(StringConstants.exceptionTextPokemon);
    }
  }

  Future<Pokemon> fetchPokemonByName(String name) async {
    final response = await client.get(
      Uri.parse(StringConstants.pokemonByNameUrl + '$name'),
    );
    if (response.statusCode == NumericConstants.statusCode) {
      var pokemon = Pokemon.fromJson(
        json.decode(
          response.body,
        ),
      );
      var evolvesTo = await _getEvolvesTo(pokemon);
      return pokemon.copyWith(evolvesTo: evolvesTo);
    } else {
      throw Exception(StringConstants.exceptionTextPokemon);
    }
  }

  Future<String> _getNextEvolutionName(
    String url,
    String pokemonName,
  ) async {
    try {
      final response = await client.get(
        Uri.parse(url),
      );
      if (response.statusCode == NumericConstants.statusCode) {
        var evolutionResponse = EvolutionResponse.fromJson(
          json.decode(
            response.body,
          ),
        );
        var pokemonEvolutionName = StringConstants.emptyString;
        Chain chain = evolutionResponse.evolvesTo;
        var hasEvolution = false;
        while ((chain.evolvesTo.isNotEmpty) && !hasEvolution) {
          if (chain.species.name == pokemonName) {
            hasEvolution = true;
            pokemonEvolutionName = chain.evolvesTo.first.species.name;
          } else {
            chain = chain.evolvesTo.first;
          }
        }
        return pokemonEvolutionName;
      } else {
        throw Exception(StringConstants.exceptionTextPokemon);
      }
    } catch (e) {}
    return StringConstants.emptyString;
  }
}


