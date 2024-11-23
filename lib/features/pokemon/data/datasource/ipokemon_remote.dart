
import 'package:dartz/dartz.dart';
import 'package:starter_application/core/datasources/remote_data_source.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/features/pokemon/data/model/request/get_pokemons_parameter.dart';
import 'package:starter_application/features/pokemon/data/model/response/pokemon_model/pokemon_list_model.dart';

abstract class IPokemonRemoteSource extends RemoteDataSource{
  Future<Either<AppErrors, PokemonListModel>> getPokemons(GetPokemonsParameter parameter);

}
