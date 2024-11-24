import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:socially/di/service_locator.dart';

import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/params/no_params.dart';
import '../../../domain/entity/profile_entity.dart';
import '../../../domain/usecase/get_profile_usecase.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.profileInitState());

  Future<void> getProfile() async {
    emit(const ProfileState.profileLoadingState());
    final result = await getIt<GetProfileUseCase>().call(NoParams());
    result.pick(
      onData: (data) => emit(ProfileState.profileLoadedState(profile: data)),
      onError: (error) => emit(
        ProfileState.profileErrorState(
          error,
          this.getProfile,
        ),
      ),
    );
  }
}
