import 'stat.dart';

class PokemonStat {
  PokemonStat({
    required baseStat,
    required effort,
    required stat,
  });

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
