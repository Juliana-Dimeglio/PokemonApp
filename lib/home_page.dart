import 'package:flutter/material.dart';
import 'src/core/util/call_enum.dart';
import 'src/data/model/pokemon_response.dart';
import 'src/presentation/view/detail_screen.dart';
import 'src/presentation/widget/grid_tile_pokemons.dart';
import 'src/core/util/numeric_constants.dart';
import 'src/core/util/string_constants.dart';
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
  late PageController _controller;
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pokemonBloc = PokemonBloc()..initialize();
    _pokemonBloc.fetchAllPokemons(Call.fetchPokemon);
    _controller = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    _pokemonBloc.dispose();
    super.dispose();
  }

  Widget buildList(PokemonResponse data) {
    return PageView.builder(
        physics: BouncingScrollPhysics(),
        onPageChanged: (index) {
          _pokemonBloc.pageChange(currentPage, _controller);
          currentPage = _controller.page!;
          setState(() {});
        },
        itemCount: (data.count / 20.0).round(),
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return GridView.builder(
              itemCount: data.pokemonResults.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: NumericConstants.crossAxisCount,
              ),
              itemBuilder: (BuildContext context, index) {
                return OpenContainer(
                  openColor: Colors.black,
                  transitionType: ContainerTransitionType.fadeThrough,
                  transitionDuration: Duration(
                    seconds: 1,
                  ),
                  openBuilder: (context, _) => DetailScreen(
                    pokemon: data.pokemonResults[index],
                  ),
                  closedBuilder: (context, openContainer) => InkWell(
                    onTap: () {
                      openContainer();
                    },
                    child: GridTilePokemons(
                      pokemon: data.pokemonResults[index],
                    ),
                  ),
                );
              });
        });
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
        body: StreamBuilder<PokemonResponse?>(
            stream: _pokemonBloc.allPokemonsStream,
            builder: (context, AsyncSnapshot<PokemonResponse?> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
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
