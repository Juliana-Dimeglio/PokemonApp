import 'package:flutter/material.dart';
import 'pokemon_presentation_card.dart';
import '../../core/util/capitalize.dart';
import '../../core/util/numeric_constants.dart';
import '../../data/model/pokemon.dart';

class GridTilePokemons extends StatelessWidget {
  const GridTilePokemons({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(
                NumericConstants.boxShadowOpacity,
              ),
              spreadRadius: NumericConstants.boxShadowSpreadRadius,
              blurRadius: NumericConstants.boxShadowBlurRadius,
              offset: Offset(
                NumericConstants.boxShadowOffsetDX,
                NumericConstants.boxShadowOffsetDY,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(
            NumericConstants.pokemonsBorderRadius,
          ),
          color: Colors.white,
        ),
        margin: EdgeInsets.all(
          NumericConstants.pokemonsMargin,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pokemon.name.capitalize(),
              style: TextStyle(
                fontSize: NumericConstants.pokemonsNameFontSize,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: NumericConstants.gridTileMargin,
                ),
                child: PokemonPresentationCard(
                  imageUrl: pokemon.sprites.other.officialArtwork.frontDefault,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
