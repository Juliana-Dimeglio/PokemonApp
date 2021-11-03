import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../domain/entity/pokemon_entity.dart';
import '../../../../core/util/string_constants.dart';
import '../../../model/pokemon.dart';

class PokemonDatabase {
  PokemonDatabase();

  FirebaseFirestore get firestoreInstance => FirebaseFirestore.instance;

  CollectionReference get pokemon =>
      FirebaseFirestore.instance.collection(StringConstants.pokemonCollection);

  CollectionReference get stats =>
      FirebaseFirestore.instance.collection(StringConstants.statsCollection);

  void dispose() {}

  void initialize() {}

  Future<List<Pokemon>> fetchPokemonList() async {
    List<Pokemon> list = [];
    await pokemon.orderBy(StringConstants.id).get().then(
          (value) => value.docs.forEach((element) {
            list.add(
              Pokemon.fromJson(element.data() as Map<String, dynamic>),
            );
          }),
        );
    return list;
  }

  Future<void> clearDatabase() async {
    await pokemon.get().then((value) {
      for (DocumentSnapshot doc in value.docs) {
        doc.reference.delete();
      }
    });
    await stats.doc(StringConstants.pokemonCount).update({
      StringConstants.pokemons: 0,
    });
  }

  Future<void> addPokemonToFirebase(List<Pokemon> pokemonList) async {
    await Future.forEach(pokemonList, (poke) async {
      var element = poke! as Pokemon;
      await pokemon.doc().set(
            PokemonEntity(
              abilities: element.abilities,
              baseExperience: element.baseExperience,
              forms: element.forms,
              gameIndices: element.gameIndices,
              height: element.height,
              heldItems: element.heldItems,
              id: element.id,
              isDefault: element.isDefault,
              locationAreaEncounters: element.locationAreaEncounters,
              moves: element.moves,
              name: element.name,
              order: element.order,
              pastTypes: element.pastTypes,
              species: element.species,
              sprites: element.sprites,
              stats: element.stats,
              types: element.types,
              weight: element.weight,
              evolvesTo: element.evolvesTo,
            ).toJson(),
          );
      await stats.doc(StringConstants.pokemonCount).update({
        StringConstants.pokemons: FieldValue.increment(1),
      });
    });
  }
}
