import 'package:starter_application/core/entities/base_entity.dart';
import 'package:starter_application/features/pokemon/domain/entity/pokemon_entity/pokemon_entity.dart';

class PokemonListEntity extends BaseEntity{
    PokemonListEntity({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    final int? count;
    final String? next;
    final String? previous;
    final List<PokemonEntity> results;

  @override
  List<Object?> get props => [count, next, previous, results];
}

