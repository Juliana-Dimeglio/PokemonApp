import '../../data/model/stat.dart';

class PokemonStatEntity {
  PokemonStatEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int baseStat;
  final int effort;
  final Stat stat;
}
