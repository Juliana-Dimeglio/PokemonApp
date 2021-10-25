import 'package:flutter/material.dart';
import '../../core/util/numeric_constants.dart';

class PokemonTableRow extends StatelessWidget {
  const PokemonTableRow({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(
            NumericConstants.tableRowPadding,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: NumericConstants.tableRowFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
