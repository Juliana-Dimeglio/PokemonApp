import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/util/capitalize.dart';
import '../../core/util/styles/styles.dart';
import '../../domain/usecase/implementation/evolutions_usecase.dart';
import '../../data/model/pokemon.dart';
import '../widget/pokemons_artwork_swiper.dart';
import '../widget/pokemon_table.dart';
import '../../core/util/numeric_constants.dart';
import '../../core/util/string_constants.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Pokemon _pokemon;
  late Pokemon pokemonEvolution;

  @override
  void initState() {
    super.initState();
    _pokemon = widget.pokemon;
  }

  Future<Pokemon> getPokemonEvolution() async {
    pokemonEvolution = await GetEvolutionsUseCase(
      name: _pokemon.evolvesTo!,
    ).evolutionCall();
    return pokemonEvolution;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red.shade900,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: NumericConstants.iconSize,
            ),
          ),
          title: Image.asset(
            StringConstants.logoImage,
            width: NumericConstants.logoImageWidth,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      NumericConstants.pokemonNameDetailPadding,
                    ),
                    child: Text(
                      _pokemon.name.capitalize(),
                      style: TextStyle(
                        fontSize: NumericConstants.pokemonNameDetailFontSize,
                      ),
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        _pokemon.sprites.other.officialArtwork.frontDefault,
                    width: NumericConstants.detailImageSize,
                    height: NumericConstants.detailImageSize,
                  ),
                  _pokemon.evolvesTo!.isNotEmpty
                      ? ElevatedButton(
                          onPressed: () async {
                            pokemonEvolution = await getPokemonEvolution();
                            _pokemon = pokemonEvolution;
                            setState(() {});
                          },
                          child: Text(
                            StringConstants.evolutionButtonText,
                            style: TextStyle(
                              color: Colors.yellowAccent.shade700,
                              fontSize:
                                  NumericConstants.evolutionButtonFontSize,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: evolutionButtonColor,
                          ),
                        )
                      : Container(),
                  PokemonTable(
                    pokemon: _pokemon,
                  ),
                  Text(
                    StringConstants.galleryText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: NumericConstants.galleryTitleSize,
                    ),
                  ),
                  SizedBox(
                    height: NumericConstants.galleryHeight,
                    child: PokemonsArtworkSwiper(
                      pokemonSprites: _pokemon.sprites,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
