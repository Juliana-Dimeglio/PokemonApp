import 'package:flutter/material.dart';
import 'src/presentation/bloc/pokemon_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokemonBloc _pokemonBloc = PokemonBloc();

  @override
  void initState() {
    super.initState();
    _pokemonBloc.initialize();
    _pokemonBloc.fetchAllPokemons();
  }

  @override
  void dispose() {
    super.dispose();
    _pokemonBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
