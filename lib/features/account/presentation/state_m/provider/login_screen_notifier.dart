import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/custom_modules/screen_notifier.dart';
import '../../../../../core/common/utils/utils.dart';
import '../../../data/request/param/login_request.dart';
import '../../screen/login_screen.dart';
import '../cubit/account_cubit.dart';

class LoginScreenNotifier extends ScreenNotifier {
  LoginScreenNotifier(this.param);

  // fields
  final LoginScreenParam param;
  final myFocusNodeUserName = FocusNode();
  final myFocusNodePassword = FocusNode();
  final cancelToken = CancelToken();
  final phoneOrEmailKey = GlobalKey<FormFieldState<String>>();
  final passwordKey = GlobalKey<FormFieldState<String>>();
  final phoneOrEmailController = TextEditingController(text: "0931607158");
  final passwordController = TextEditingController(text: "12345678");

  bool _turnPhoneOrEmailValidate = true;
  bool _turnPasswordValidate = true;
  bool _passwordSecure = true;
  bool _inAsyncCall = false;

  // Get, Set
  bool get inAsyncCall => _inAsyncCall;
  bool get passwordSecure => _passwordSecure;
  bool get turnPhoneOrEmailValidate => _turnPhoneOrEmailValidate;
  bool get turnPasswordValidate => _turnPasswordValidate;

  set inAsyncCall(bool v) {
    _inAsyncCall = v;
    notifyListeners();
  }

  set passwordSecure(bool v) {
    _passwordSecure = v;
    notifyListeners();
  }

  set turnPhoneOrEmailValidate(bool v) {
    _turnPhoneOrEmailValidate = v;
    notifyListeners();
  }

  set turnPasswordValidate(bool v) {
    _turnPasswordValidate = v;
    notifyListeners();
  }

  // method
  void unFocus(BuildContext context) {
    Utils.unFocus(context);
  }

  void sendRequest(BuildContext context) {
    unFocus(context);

    _turnPhoneOrEmailValidate = true;
    _turnPasswordValidate = true;
    notifyListeners();

    if (phoneOrEmailKey.currentState!.validate()) {
      if (passwordKey.currentState!.validate()) {
        BlocProvider.of<AccountCubit>(context).login(
          LoginRequest(
            phoneNumber:
                phoneOrEmailController.text.replaceAll(RegExp("[^0-9]"), ""),
            email: phoneOrEmailController.text,
            password: passwordController.text,
            cancelToken: cancelToken,
          ),
        );
      }
    }
  }

  @override
  void closeNotifier() {
    cancelToken.cancel();
    phoneOrEmailController.dispose();
    passwordController.dispose();
    myFocusNodeUserName.dispose();
    myFocusNodePassword.dispose();
    this.dispose();
  }
}
