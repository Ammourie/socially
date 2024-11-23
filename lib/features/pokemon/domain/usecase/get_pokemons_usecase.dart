import 'package:injectable/injectable.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/usecases/usecase.dart';
import 'package:starter_application/features/pokemon/data/model/request/get_pokemons_parameter.dart';
import 'package:starter_application/features/pokemon/domain/entity/pokemon_entity/pkemon_list_entity.dart';
import 'package:starter_application/features/pokemon/domain/repository/irepository.dart';

@injectable
class GetPokemonsUseCase
    extends UseCase<PokemonListEntity, GetPokemonsParameter> {
  final IPokemonRepository repoistory;

  GetPokemonsUseCase(this.repoistory);
  @override
  Future<Result<AppErrors, PokemonListEntity>> call(
      GetPokemonsParameter params) {
    return repoistory.getPokemons(params);
  }
}
