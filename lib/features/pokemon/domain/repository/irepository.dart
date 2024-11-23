import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/repositories/repository.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/features/pokemon/data/model/request/get_pokemons_parameter.dart';
import 'package:starter_application/features/pokemon/domain/entity/pokemon_entity/pkemon_list_entity.dart';

abstract class IPokemonRepository extends Repository{
  Future<Result<AppErrors, PokemonListEntity>> getPokemons(GetPokemonsParameter parameter);
}
