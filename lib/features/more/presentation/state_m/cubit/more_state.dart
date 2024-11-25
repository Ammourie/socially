part of 'more_cubit.dart';

@freezed
class MoreState with _$MoreState {
  const factory MoreState.moreInit() = MoreInitState;

  const factory MoreState.moreLoading() = MoreLoadingState;

  const factory MoreState.successReportProblem() = SuccessReportProblemState;

  const factory MoreState.checkUpdateAppLoaded({
    required VersionEntity data,
  }) = CheckUpdateAppLoadedState;

  const factory MoreState.moreError(
    AppErrors error,
    VoidCallback callback,
  ) = MoreErrorState;
}
