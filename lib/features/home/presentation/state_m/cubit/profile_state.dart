part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.profileInitState() = ProfileInitState;

  const factory ProfileState.profileLoadingState() = ProfileLoadingState;

  const factory ProfileState.profileLoadedState({
    required ProfileEntity profile,
  }) = ProfileLoadedState;

  const factory ProfileState.profileErrorState(
    AppErrors error,
    VoidCallback callback,
  ) = ProfileErrorState;
}
