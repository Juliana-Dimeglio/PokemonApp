import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../loading_page.dart';
import '../../../core/util/numeric_constants.dart';
import '../../../data/model/pokemon_response.dart';
import '../../bloc/model/state_model.dart';
import '../../bloc/pokemon_bloc.dart';
import '../../view/detail_screen.dart';
import '../grid_tile_pokemons.dart';

class PokemonState extends StatefulWidget {
  PokemonState({
    Key? key,
    required this.stateModel,
    required this.pokemonBloc,
  }) : super(key: key);
  final StateModel stateModel;
  final PokemonBloc pokemonBloc;

  @override
  _PokemonStateState createState() => _PokemonStateState();
}

class _PokemonStateState extends State<PokemonState> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildList(PokemonResponse data) {
    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
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
    switch (widget.stateModel.state) {
      case StateType.success:
        return buildList(widget.stateModel.response!);
      case StateType.loading:
        return Center(
          child: LoadingPage(),
        );
      default:
        return Container();
    }
  }
}
