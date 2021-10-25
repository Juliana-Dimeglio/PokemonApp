import 'package:flutter/material.dart';
import '../../core/util/string_constants.dart';
import '../../core/util/numeric_constants.dart';
import '../../core/util/styles/styles.dart';
import '../../data/model/pokemon.dart';
import 'pokemon_table_row.dart';

class PokemonTable extends StatelessWidget {
  const PokemonTable({
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: NumericConstants.tablePadding,
        ),
        child: Table(
          defaultColumnWidth: FixedColumnWidth(
            NumericConstants.fixedColumnWidth,
          ),
          border: TableBorder.all(
            color: Colors.transparent,
            style: BorderStyle.solid,
            width: NumericConstants.tableBorderWidth,
          ),
          children: [
            TableRow(
              children: [
                PokemonTableRow(
                  text: StringConstants.pokemonTableRowHeight,
                ),
                PokemonTableRow(
                  text: '${pokemon.height}',
                ),
              ],
            ),
            TableRow(
              children: [
                PokemonTableRow(
                  text: StringConstants.pokemonTableRowWeight,
                ),
                PokemonTableRow(
                  text: '${pokemon.weight}',
                ),
              ],
            ),
            TableRow(
              children: [
                PokemonTableRow(
                  text: StringConstants.pokemonTableRowBaseExperience,
                ),
                PokemonTableRow(
                  text: '${pokemon.baseExperience}',
                ),
              ],
            ),
            TableRow(
              children: [
                PokemonTableRow(
                  text: StringConstants.pokemonTableRowAbilities,
                ),
                PokemonTableRow(
                  text: '${pokemon.pokemonAbilitiesNames()}',
                ),
              ],
            ),
            TableRow(
              children: [
                PokemonTableRow(
                  text: 'Types: ',
                ),
                PokemonTableRow(
                  text: '${pokemon.pokemonTypesNames()}',
                ),
              ],
            ),
            TableRow(
              children: [
                PokemonTableRow(
                  text: 'Stats: ',
                ),
                PokemonTableRow(
                  text: '${pokemon.pokemonStatsNames()}',
                ),
              ],
            ),
            pokemon.pokemonItemNames() != StringConstants.emptyString
                ? TableRow(
                    children: [
                      PokemonTableRow(
                        text: StringConstants.pokemonTableRowItems,
                      ),
                      PokemonTableRow(
                        text: '${pokemon.pokemonItemNames()}',
                      ),
                    ],
                  )
                : TableRow(
                    children: [
                      Container(),
                      Container(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
