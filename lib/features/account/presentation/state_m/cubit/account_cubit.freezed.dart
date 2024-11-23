// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function()? successLogout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(SuccessLogoutState value)? successLogout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res, AccountState>;
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res, $Val extends AccountState>
    implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AccountInitImplCopyWith<$Res> {
  factory _$$AccountInitImplCopyWith(
          _$AccountInitImpl value, $Res Function(_$AccountInitImpl) then) =
      __$$AccountInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountInitImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountInitImpl>
    implements _$$AccountInitImplCopyWith<$Res> {
  __$$AccountInitImplCopyWithImpl(
      _$AccountInitImpl _value, $Res Function(_$AccountInitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AccountInitImpl implements AccountInit {
  const _$AccountInitImpl();

  @override
  String toString() {
    return 'AccountState.accountInit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountInitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return accountInit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function()? successLogout,
  }) {
    return accountInit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (accountInit != null) {
      return accountInit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return accountInit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(SuccessLogoutState value)? successLogout,
  }) {
    return accountInit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (accountInit != null) {
      return accountInit(this);
    }
    return orElse();
  }
}

abstract class AccountInit implements AccountState {
  const factory AccountInit() = _$AccountInitImpl;
}

/// @nodoc
abstract class _$$AccountLoadingImplCopyWith<$Res> {
  factory _$$AccountLoadingImplCopyWith(_$AccountLoadingImpl value,
          $Res Function(_$AccountLoadingImpl) then) =
      __$$AccountLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AccountLoadingImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountLoadingImpl>
    implements _$$AccountLoadingImplCopyWith<$Res> {
  __$$AccountLoadingImplCopyWithImpl(
      _$AccountLoadingImpl _value, $Res Function(_$AccountLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AccountLoadingImpl implements AccountLoading {
  const _$AccountLoadingImpl();

  @override
  String toString() {
    return 'AccountState.accountLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AccountLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return accountLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function()? successLogout,
  }) {
    return accountLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (accountLoading != null) {
      return accountLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return accountLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(SuccessLogoutState value)? successLogout,
  }) {
    return accountLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (accountLoading != null) {
      return accountLoading(this);
    }
    return orElse();
  }
}

abstract class AccountLoading implements AccountState {
  const factory AccountLoading() = _$AccountLoadingImpl;
}

/// @nodoc
abstract class _$$AccLoginLoadedImplCopyWith<$Res> {
  factory _$$AccLoginLoadedImplCopyWith(_$AccLoginLoadedImpl value,
          $Res Function(_$AccLoginLoadedImpl) then) =
      __$$AccLoginLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginEntity loginEntity});
}

/// @nodoc
class __$$AccLoginLoadedImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccLoginLoadedImpl>
    implements _$$AccLoginLoadedImplCopyWith<$Res> {
  __$$AccLoginLoadedImplCopyWithImpl(
      _$AccLoginLoadedImpl _value, $Res Function(_$AccLoginLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginEntity = null,
  }) {
    return _then(_$AccLoginLoadedImpl(
      null == loginEntity
          ? _value.loginEntity
          : loginEntity // ignore: cast_nullable_to_non_nullable
              as LoginEntity,
    ));
  }
}

/// @nodoc

class _$AccLoginLoadedImpl implements AccLoginLoaded {
  const _$AccLoginLoadedImpl(this.loginEntity);

  @override
  final LoginEntity loginEntity;

  @override
  String toString() {
    return 'AccountState.loginLoaded(loginEntity: $loginEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccLoginLoadedImpl &&
            (identical(other.loginEntity, loginEntity) ||
                other.loginEntity == loginEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccLoginLoadedImplCopyWith<_$AccLoginLoadedImpl> get copyWith =>
      __$$AccLoginLoadedImplCopyWithImpl<_$AccLoginLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return loginLoaded(loginEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function()? successLogout,
  }) {
    return loginLoaded?.call(loginEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (loginLoaded != null) {
      return loginLoaded(loginEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return loginLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(SuccessLogoutState value)? successLogout,
  }) {
    return loginLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (loginLoaded != null) {
      return loginLoaded(this);
    }
    return orElse();
  }
}

abstract class AccLoginLoaded implements AccountState {
  const factory AccLoginLoaded(final LoginEntity loginEntity) =
      _$AccLoginLoadedImpl;

  LoginEntity get loginEntity;
  @JsonKey(ignore: true)
  _$$AccLoginLoadedImplCopyWith<_$AccLoginLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccRegisterLoadedImplCopyWith<$Res> {
  factory _$$AccRegisterLoadedImplCopyWith(_$AccRegisterLoadedImpl value,
          $Res Function(_$AccRegisterLoadedImpl) then) =
      __$$AccRegisterLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterEntity registerEntity});
}

/// @nodoc
class __$$AccRegisterLoadedImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccRegisterLoadedImpl>
    implements _$$AccRegisterLoadedImplCopyWith<$Res> {
  __$$AccRegisterLoadedImplCopyWithImpl(_$AccRegisterLoadedImpl _value,
      $Res Function(_$AccRegisterLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerEntity = null,
  }) {
    return _then(_$AccRegisterLoadedImpl(
      null == registerEntity
          ? _value.registerEntity
          : registerEntity // ignore: cast_nullable_to_non_nullable
              as RegisterEntity,
    ));
  }
}

/// @nodoc

class _$AccRegisterLoadedImpl implements AccRegisterLoaded {
  const _$AccRegisterLoadedImpl(this.registerEntity);

  @override
  final RegisterEntity registerEntity;

  @override
  String toString() {
    return 'AccountState.registerLoaded(registerEntity: $registerEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccRegisterLoadedImpl &&
            (identical(other.registerEntity, registerEntity) ||
                other.registerEntity == registerEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, registerEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccRegisterLoadedImplCopyWith<_$AccRegisterLoadedImpl> get copyWith =>
      __$$AccRegisterLoadedImplCopyWithImpl<_$AccRegisterLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return registerLoaded(registerEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function()? successLogout,
  }) {
    return registerLoaded?.call(registerEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (registerLoaded != null) {
      return registerLoaded(registerEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return registerLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(SuccessLogoutState value)? successLogout,
  }) {
    return registerLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (registerLoaded != null) {
      return registerLoaded(this);
    }
    return orElse();
  }
}

abstract class AccRegisterLoaded implements AccountState {
  const factory AccRegisterLoaded(final RegisterEntity registerEntity) =
      _$AccRegisterLoadedImpl;

  RegisterEntity get registerEntity;
  @JsonKey(ignore: true)
  _$$AccRegisterLoadedImplCopyWith<_$AccRegisterLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountErrorImplCopyWith<$Res> {
  factory _$$AccountErrorImplCopyWith(
          _$AccountErrorImpl value, $Res Function(_$AccountErrorImpl) then) =
      __$$AccountErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppErrors error, VoidCallback callback});

  $AppErrorsCopyWith<$Res> get error;
}

/// @nodoc
class __$$AccountErrorImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$AccountErrorImpl>
    implements _$$AccountErrorImplCopyWith<$Res> {
  __$$AccountErrorImplCopyWithImpl(
      _$AccountErrorImpl _value, $Res Function(_$AccountErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? callback = null,
  }) {
    return _then(_$AccountErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppErrors,
      null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppErrorsCopyWith<$Res> get error {
    return $AppErrorsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$AccountErrorImpl implements AccountError {
  const _$AccountErrorImpl(this.error, this.callback);

  @override
  final AppErrors error;
  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'AccountState.accountError(error: $error, callback: $callback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountErrorImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, callback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountErrorImplCopyWith<_$AccountErrorImpl> get copyWith =>
      __$$AccountErrorImplCopyWithImpl<_$AccountErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return accountError(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function()? successLogout,
  }) {
    return accountError?.call(error, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (accountError != null) {
      return accountError(error, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return accountError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(SuccessLogoutState value)? successLogout,
  }) {
    return accountError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (accountError != null) {
      return accountError(this);
    }
    return orElse();
  }
}

abstract class AccountError implements AccountState {
  const factory AccountError(
      final AppErrors error, final VoidCallback callback) = _$AccountErrorImpl;

  AppErrors get error;
  VoidCallback get callback;
  @JsonKey(ignore: true)
  _$$AccountErrorImplCopyWith<_$AccountErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessLogoutStateImplCopyWith<$Res> {
  factory _$$SuccessLogoutStateImplCopyWith(_$SuccessLogoutStateImpl value,
          $Res Function(_$SuccessLogoutStateImpl) then) =
      __$$SuccessLogoutStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessLogoutStateImplCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res, _$SuccessLogoutStateImpl>
    implements _$$SuccessLogoutStateImplCopyWith<$Res> {
  __$$SuccessLogoutStateImplCopyWithImpl(_$SuccessLogoutStateImpl _value,
      $Res Function(_$SuccessLogoutStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessLogoutStateImpl implements SuccessLogoutState {
  const _$SuccessLogoutStateImpl();

  @override
  String toString() {
    return 'AccountState.successLogout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessLogoutStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() accountInit,
    required TResult Function() accountLoading,
    required TResult Function(LoginEntity loginEntity) loginLoaded,
    required TResult Function(RegisterEntity registerEntity) registerLoaded,
    required TResult Function(AppErrors error, VoidCallback callback)
        accountError,
    required TResult Function() successLogout,
  }) {
    return successLogout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? accountInit,
    TResult? Function()? accountLoading,
    TResult? Function(LoginEntity loginEntity)? loginLoaded,
    TResult? Function(RegisterEntity registerEntity)? registerLoaded,
    TResult? Function(AppErrors error, VoidCallback callback)? accountError,
    TResult? Function()? successLogout,
  }) {
    return successLogout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? accountInit,
    TResult Function()? accountLoading,
    TResult Function(LoginEntity loginEntity)? loginLoaded,
    TResult Function(RegisterEntity registerEntity)? registerLoaded,
    TResult Function(AppErrors error, VoidCallback callback)? accountError,
    TResult Function()? successLogout,
    required TResult orElse(),
  }) {
    if (successLogout != null) {
      return successLogout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AccountInit value) accountInit,
    required TResult Function(AccountLoading value) accountLoading,
    required TResult Function(AccLoginLoaded value) loginLoaded,
    required TResult Function(AccRegisterLoaded value) registerLoaded,
    required TResult Function(AccountError value) accountError,
    required TResult Function(SuccessLogoutState value) successLogout,
  }) {
    return successLogout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AccountInit value)? accountInit,
    TResult? Function(AccountLoading value)? accountLoading,
    TResult? Function(AccLoginLoaded value)? loginLoaded,
    TResult? Function(AccRegisterLoaded value)? registerLoaded,
    TResult? Function(AccountError value)? accountError,
    TResult? Function(SuccessLogoutState value)? successLogout,
  }) {
    return successLogout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AccountInit value)? accountInit,
    TResult Function(AccountLoading value)? accountLoading,
    TResult Function(AccLoginLoaded value)? loginLoaded,
    TResult Function(AccRegisterLoaded value)? registerLoaded,
    TResult Function(AccountError value)? accountError,
    TResult Function(SuccessLogoutState value)? successLogout,
    required TResult orElse(),
  }) {
    if (successLogout != null) {
      return successLogout(this);
    }
    return orElse();
  }
}

abstract class SuccessLogoutState implements AccountState {
  const factory SuccessLogoutState() = _$SuccessLogoutStateImpl;
}
