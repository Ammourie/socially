import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/di/service_locator.dart';
import 'package:starter_application/features/pokemon/domain/entity/pokemon_entity/pkemon_list_entity.dart';
import 'package:starter_application/features/pokemon/domain/usecase/get_pokemons_usecase.dart';
import 'package:starter_application/features/pokemon/data/model/request/get_pokemons_parameter.dart';

part 'pokemon_state.dart';

part 'pokemon_cubit.freezed.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(const PokemonState.pokemonInitState());

  void getPokemons(
    GetPokemonsParameter parameter,
  ) async {
    emit(const PokemonState.pokemonLoadingState());
    final result = await getIt<GetPokemonsUseCase>()(
      parameter,
    );

    result.pick(
      onData: (data) {
        emit(PokemonState.getPokemonsLoadedState(result.data!));
      },
      onError: (error) {
        emit(
          PokemonState.pokemonErrorState(
            result.error!,
            () => this.getPokemons(parameter),
          ),
        );
      },
    );
  }
}
