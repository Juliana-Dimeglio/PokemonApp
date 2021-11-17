import 'package:flutter/material.dart';
import 'src/presentation/widget/pokemon_page_button.dart';
import 'src/core/util/styles/styles.dart';
import 'src/presentation/view/splash_screen.dart';
import 'src/presentation/widget/state_widget/pokemon_state.dart';
import 'src/core/util/call_enum.dart';
import 'src/presentation/bloc/model/state_model.dart';
import 'src/core/util/numeric_constants.dart';
import 'src/core/util/string_constants.dart';
import 'src/presentation/bloc/pokemon_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const initialPageNumber = 1;
  late PokemonBloc _pokemonBloc;
  late int pageNumber;
  late int? cantPages;

  @override
  void initState() {
    super.initState();
    _pokemonBloc = PokemonBloc()..initialize();
    _pokemonBloc.fetchAllPokemons(Call.fetchPokemon);
    pageNumber = initialPageNumber;
  }

  @override
  void dispose() {
    _pokemonBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<StateModel>(
          stream: _pokemonBloc.allPokemonsStream,
          initialData: StateModel(
            state: StateType.splashScreen,
          ),
          builder: (context, snapshot) {
            cantPages = ((snapshot.data?.response?.count ?? 0) /
                    NumericConstants.maxCantPokemonPage)
                .round();
            if (snapshot.data?.state == StateType.splashScreen) {
              return SplashScreen();
            } else {
              return Scaffold(
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
                body: PokemonState(
                  stateModel: snapshot.data!,
                  pokemonBloc: _pokemonBloc,
                ),
                bottomNavigationBar: Container(
                  color: Colors.red.shade900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PokemonPageButton(
                        function: pageNumber != initialPageNumber
                            ? () {
                                _pokemonBloc.getPreviousPage();
                                pageNumber--;
                                setState(() {});
                              }
                            : () {},
                        icon: Icons.arrow_back,
                      ),
                      snapshot.data?.state == StateType.loading
                          ? Text(
                              StringConstants.emptyString,
                            )
                          : Stack(
                              children: [
                                Text(
                                  StringConstants.pageText +
                                      ' $pageNumber - $cantPages',
                                  style: pageTextStyleBorder,
                                ),
                                Text(
                                  StringConstants.pageText +
                                      ' $pageNumber - $cantPages',
                                  style: pageTextStyle,
                                ),
                              ],
                            ),
                      PokemonPageButton(
                        function: pageNumber != cantPages
                            ? () {
                                _pokemonBloc.getNextPage();
                                pageNumber++;
                                setState(() {});
                              }
                            : () {},
                        icon: Icons.arrow_forward,
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
