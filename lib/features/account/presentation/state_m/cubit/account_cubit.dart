import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/common/app_config.dart';
import '../../../../../core/common/local_storage.dart';
import '../../../../../core/common/utils/cubit_utils.dart';
import '../../../../../core/constants/shared_preference/shared_preference_keys.dart';
import '../../../../../core/errors/app_errors.dart';
import '../../../../../core/results/result.dart';
import '../../../../../core/ui/widgets/restart_widget.dart';
import '../../../../../di/service_locator.dart';
import '../../../data/request/param/login_request.dart';
import '../../../data/request/param/register_request.dart';
import '../../../domain/entity/login_entity.dart';
import '../../../domain/entity/register_entity.dart';
import '../../../domain/usecase/login_usecase.dart';
import '../../../domain/usecase/register_usecase.dart';

part 'account_cubit.freezed.dart';
part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState.accountInit());

  void login(LoginRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<LoginUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.loginLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => this.login(body)));
      },
    );
  }

  void register(RegisterRequest body) async {
    emit(const AccountState.accountLoading());

    final result = await getIt<RegisterUseCase>()(body);

    result.pick(
      onData: (data) {
        emit(AccountState.registerLoaded(result.data!));
      },
      onError: (error) {
        emit(AccountState.accountError(error, () => this.register(body)));
      },
    );
  }

  void logout() async {
    emit(const AccountState.accountLoading());

    for (String key in SharedPreferenceKeys.REMOVE_KEYS_ON_LOGOUT) {
      bool success = await LocalStorage.sharedPreferences.remove(key);
      if (success) debugPrint("$key removed");
    }

    // Todo: remove this line
    await Future.delayed(const Duration(seconds: 1));

    final List<Result> results = await Future.wait([]);
    final error = CubitUtils.checkError(results);

    if (error != null) {
      emit(AccountState.accountError(error, () => this.logout()));
    } else {
      emit(const AccountState.successLogout());
      RestartWidget.restartApp(AppConfig().appContext!);
    }
  }
}
