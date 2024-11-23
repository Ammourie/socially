import 'package:injectable/injectable.dart';
import 'package:starter_application/core/common/extensions/either_error_model_extension.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/features/pokemon/data/datasource/ipokemon_remote.dart';
import 'package:starter_application/features/pokemon/data/model/request/get_pokemons_parameter.dart';
import 'package:starter_application/features/pokemon/domain/entity/pokemon_entity/pkemon_list_entity.dart';
import 'package:starter_application/features/pokemon/domain/repository/irepository.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepository extends IPokemonRepository {
  final IPokemonRemoteSource remoteSource;

  PokemonRepository(this.remoteSource);

  @override
  Future<Result<AppErrors, PokemonListEntity>> getPokemons(
      GetPokemonsParameter parameter) async {
    return (await remoteSource.getPokemons(parameter))
        .result<PokemonListEntity>();
  }
}
