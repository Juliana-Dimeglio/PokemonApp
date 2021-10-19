import '../../domain/entity/pokemon_stat_entity.dart';

import 'stat.dart';

class PokemonStat extends PokemonStatEntity {
  PokemonStat({
    required baseStat,
    required effort,
    required stat,
  }) : super(
          baseStat: baseStat,
          effort: effort,
          stat: stat,
        );

  factory PokemonStat.fromJson(Map<String, dynamic> parsedJson) {
    return PokemonStat(
      baseStat: parsedJson['base_stat'],
      effort: parsedJson['effort'],
      stat: Stat.fromJson(
        parsedJson['stat'],
      ),
    );
  }
}
