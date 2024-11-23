// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i3;
import 'package:starter_application/core/navigation/navigation_service.dart'
    as _i4;
import 'package:starter_application/core/navigation/route_generator.dart'
    as _i5;
import 'package:starter_application/core/net/http_client.dart' as _i6;
import 'package:starter_application/di/modules/logger_module.dart' as _i37;
import 'package:starter_application/di/modules/shared_preferences_module.dart'
    as _i36;
import 'package:starter_application/features/account/data/datasource/iaccount_remote.dart'
    as _i11;
import 'package:starter_application/features/account/domain/repository/iaccount_repository.dart'
    as _i30;
import 'package:starter_application/features/account/domain/usecase/login_usecase.dart'
    as _i32;
import 'package:starter_application/features/account/domain/usecase/register_usecase.dart'
    as _i33;
import 'package:starter_application/features/home/data/datasource/ihome_remote.dart'
    as _i9;
import 'package:starter_application/features/home/domain/repository/ihome_repository.dart'
    as _i19;
import 'package:starter_application/features/home/domain/usecase/comments_usecase.dart'
    as _i21;
import 'package:starter_application/features/home/domain/usecase/get_people_usecase.dart'
    as _i22;
import 'package:starter_application/features/home/domain/usecase/test_failure_usecase.dart'
    as _i23;
import 'package:starter_application/features/home/domain/usecase/test_success_usecase.dart'
    as _i24;
import 'package:starter_application/features/home/domain/usecase/test_validator_usecase.dart'
    as _i25;
import 'package:starter_application/features/more/data/datasource/imore_remote.dart'
    as _i10;
import 'package:starter_application/features/more/domain/repository/imore_repository.dart'
    as _i20;
import 'package:starter_application/features/more/domain/usecase/check_update_app_usecase.dart'
    as _i34;
import 'package:starter_application/features/more/domain/usecase/report_problem_usecase.dart'
    as _i35;
import 'package:starter_application/features/notification/data/datasource/inotification_remote.dart'
    as _i12;
import 'package:starter_application/features/notification/domain/repository/inotification_repository.dart'
    as _i13;
import 'package:starter_application/features/notification/domain/usecase/add_or_update_firebase_token_usecase.dart'
    as _i27;
import 'package:starter_application/features/notification/domain/usecase/change_notification_status_usecase.dart'
    as _i28;
import 'package:starter_application/features/notification/domain/usecase/get_notifications_usecase.dart'
    as _i29;
import 'package:starter_application/features/pokemon/data/datasource/ipokemon_remote.dart'
    as _i14;
import 'package:starter_application/features/pokemon/data/datasource/pokemon_remote.dart'
    as _i15;
import 'package:starter_application/features/pokemon/data/repository/pokemon_repository.dart'
    as _i17;
import 'package:starter_application/features/pokemon/domain/repository/irepository.dart'
    as _i16;
import 'package:starter_application/features/pokemon/domain/usecase/get_pokemons_usecase.dart'
    as _i26;
import 'package:starter_application/features/upload/data/datasource/iupload_remote.dart'
    as _i8;
import 'package:starter_application/features/upload/domain/repository/iupload_repository.dart'
    as _i18;
import 'package:starter_application/features/upload/domain/usecase/upload_file_usecase.dart'
    as _i31;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final loggerModule = _$LoggerModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i4.NavigationService>(() => _i4.NavigationService());
    gh.lazySingleton<_i5.NavigationRoute>(() => _i5.NavigationRoute());
    gh.lazySingleton<_i6.HttpClient>(() => _i6.HttpClient());
    gh.lazySingleton<_i7.Logger>(() => loggerModule.logger);
    gh.singleton<_i8.IUploadRemoteSource>(() => _i8.UploadRemoteSource());
    gh.factory<_i9.IHomeRemoteSource>(() => _i9.HomeRemoteSource());
    gh.singleton<_i10.IMoreRemoteSource>(() => _i10.MoreRemoteSource());
    gh.factory<_i11.IAccountRemoteSource>(() => _i11.AccountRemoteSource());
    gh.singleton<_i12.INotificationRemoteSource>(
        () => _i12.NotificationRemoteSource());
    gh.singleton<_i13.INotificationRepository>(() =>
        _i13.NotificationRepository(gh<_i12.INotificationRemoteSource>()));
    gh.factory<_i14.IPokemonRemoteSource>(() => _i15.PokemonRemoteSource());
    gh.factory<_i16.IPokemonRepository>(
        () => _i17.PokemonRepository(gh<_i14.IPokemonRemoteSource>()));
    gh.singleton<_i18.IUploadRepository>(
        () => _i18.UploadRepository(gh<_i8.IUploadRemoteSource>()));
    gh.factory<_i19.IHomeRepository>(
        () => _i19.HomeRepository(gh<_i9.IHomeRemoteSource>()));
    gh.singleton<_i20.IMoreRepository>(
        () => _i20.MoreRepository(gh<_i10.IMoreRemoteSource>()));
    gh.factory<_i21.CommentsUseCase>(
        () => _i21.CommentsUseCase(gh<_i19.IHomeRepository>()));
    gh.factory<_i22.GetPeopleUseCase>(
        () => _i22.GetPeopleUseCase(gh<_i19.IHomeRepository>()));
    gh.factory<_i23.TestFailureUseCase>(
        () => _i23.TestFailureUseCase(gh<_i19.IHomeRepository>()));
    gh.factory<_i24.TestSuccessUseCase>(
        () => _i24.TestSuccessUseCase(gh<_i19.IHomeRepository>()));
    gh.factory<_i25.TestValidatorUseCase>(
        () => _i25.TestValidatorUseCase(gh<_i19.IHomeRepository>()));
    gh.factory<_i26.GetPokemonsUseCase>(
        () => _i26.GetPokemonsUseCase(gh<_i16.IPokemonRepository>()));
    gh.singleton<_i27.AddOrUpdateFirebaseTokenUsecase>(() =>
        _i27.AddOrUpdateFirebaseTokenUsecase(
            gh<_i13.INotificationRepository>()));
    gh.singleton<_i28.ChangeNotificationStatusUsecase>(() =>
        _i28.ChangeNotificationStatusUsecase(
            gh<_i13.INotificationRepository>()));
    gh.singleton<_i29.GetNotificationsUsecase>(
        () => _i29.GetNotificationsUsecase(gh<_i13.INotificationRepository>()));
    gh.factory<_i30.IAccountRepository>(
        () => _i30.AccountRepository(gh<_i11.IAccountRemoteSource>()));
    gh.singleton<_i31.UploadFileUsecase>(
        () => _i31.UploadFileUsecase(gh<_i18.IUploadRepository>()));
    gh.factory<_i32.LoginUseCase>(
        () => _i32.LoginUseCase(gh<_i30.IAccountRepository>()));
    gh.factory<_i33.RegisterUseCase>(
        () => _i33.RegisterUseCase(gh<_i30.IAccountRepository>()));
    gh.singleton<_i34.CheckUpdateAppUsecase>(
        () => _i34.CheckUpdateAppUsecase(gh<_i20.IMoreRepository>()));
    gh.factory<_i35.ReportProblemUsecase>(
        () => _i35.ReportProblemUsecase(gh<_i20.IMoreRepository>()));
    return this;
  }
}

class _$SharedPreferencesModule extends _i36.SharedPreferencesModule {}

class _$LoggerModule extends _i37.LoggerModule {}
