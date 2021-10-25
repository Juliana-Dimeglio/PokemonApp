import 'package:flutter/material.dart';
import 'src/presentation/view/detail_screen.dart';
import 'src/presentation/widget/grid_tile_pokemons.dart';
import 'src/core/util/numeric_constants.dart';
import 'src/core/util/string_constants.dart';
import 'src/data/model/pokemon.dart';
import 'src/presentation/bloc/pokemon_bloc.dart';
import 'package:animations/animations.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PokemonBloc _pokemonBloc;

  @override
  void initState() {
    super.initState();
    _pokemonBloc = PokemonBloc();
    _pokemonBloc.fetchAllPokemons();
  }

  @override
  void dispose() {
    _pokemonBloc.dispose();
    super.dispose();
  }

  Widget buildList(List<Pokemon> data) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: NumericConstants.crossAxisCount,
      ),
      itemBuilder: (BuildContext context, int index) {
        return OpenContainer(
          openColor: Colors.black,
          transitionType: ContainerTransitionType.fadeThrough,
          transitionDuration: Duration(seconds: 1),
          openBuilder: (context, _) => DetailScreen(
            pokemon: data[index],
          ),
          closedBuilder: (context, openContainer) => InkWell(
            onTap: () {
              openContainer();
            },
            child: GridTilePokemons(
              pokemon: data[index],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red.shade900,
          title: Image.asset(
            StringConstants.logoImage,
            width: NumericConstants.logoImageWidth,
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<List<Pokemon>>(
            stream: _pokemonBloc.allPokemonsStream,
            builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
              if (snapshot.hasData) {
                return buildList(
                  snapshot.data!,
                );
              } else if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
