// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:socially/core/navigation/navigation_service.dart' as _i841;
import 'package:socially/core/navigation/route_generator.dart' as _i905;
import 'package:socially/core/net/http_client.dart' as _i210;
import 'package:socially/di/modules/logger_module.dart' as _i101;
import 'package:socially/di/modules/shared_preferences_module.dart' as _i128;
import 'package:socially/features/account/data/datasource/iaccount_remote.dart'
    as _i981;
import 'package:socially/features/account/domain/repository/iaccount_repository.dart'
    as _i267;
import 'package:socially/features/account/domain/usecase/login_usecase.dart'
    as _i902;
import 'package:socially/features/account/domain/usecase/register_usecase.dart'
    as _i832;
import 'package:socially/features/home/data/datasource/ihome_remote.dart'
    as _i116;
import 'package:socially/features/home/domain/repository/ihome_repository.dart'
    as _i433;
import 'package:socially/features/home/domain/usecase/comments_usecase.dart'
    as _i82;
import 'package:socially/features/home/domain/usecase/get_people_usecase.dart'
    as _i242;
import 'package:socially/features/home/domain/usecase/get_posts_usecase.dart'
    as _i678;
import 'package:socially/features/home/domain/usecase/get_stories_usecase.dart'
    as _i403;
import 'package:socially/features/home/domain/usecase/test_failure_usecase.dart'
    as _i71;
import 'package:socially/features/home/domain/usecase/test_success_usecase.dart'
    as _i1068;
import 'package:socially/features/home/domain/usecase/test_validator_usecase.dart'
    as _i30;
import 'package:socially/features/more/data/datasource/imore_remote.dart'
    as _i459;
import 'package:socially/features/more/domain/repository/imore_repository.dart'
    as _i136;
import 'package:socially/features/more/domain/usecase/check_update_app_usecase.dart'
    as _i301;
import 'package:socially/features/more/domain/usecase/report_problem_usecase.dart'
    as _i329;
import 'package:socially/features/notification/data/datasource/inotification_remote.dart'
    as _i1041;
import 'package:socially/features/notification/domain/repository/inotification_repository.dart'
    as _i56;
import 'package:socially/features/notification/domain/usecase/add_or_update_firebase_token_usecase.dart'
    as _i359;
import 'package:socially/features/notification/domain/usecase/change_notification_status_usecase.dart'
    as _i313;
import 'package:socially/features/notification/domain/usecase/get_notifications_usecase.dart'
    as _i199;
import 'package:socially/features/upload/data/datasource/iupload_remote.dart'
    as _i139;
import 'package:socially/features/upload/domain/repository/iupload_repository.dart'
    as _i635;
import 'package:socially/features/upload/domain/usecase/upload_file_usecase.dart'
    as _i160;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final loggerModule = _$LoggerModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i841.NavigationService>(() => _i841.NavigationService());
    gh.lazySingleton<_i905.NavigationRoute>(() => _i905.NavigationRoute());
    gh.lazySingleton<_i210.HttpClient>(() => _i210.HttpClient());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.singleton<_i459.IMoreRemoteSource>(() => _i459.MoreRemoteSource());
    gh.singleton<_i139.IUploadRemoteSource>(() => _i139.UploadRemoteSource());
    gh.singleton<_i1041.INotificationRemoteSource>(
        () => _i1041.NotificationRemoteSource());
    gh.factory<_i116.IHomeRemoteSource>(() => _i116.HomeRemoteSource());
    gh.singleton<_i635.IUploadRepository>(
        () => _i635.UploadRepository(gh<_i139.IUploadRemoteSource>()));
    gh.factory<_i981.IAccountRemoteSource>(() => _i981.AccountRemoteSource());
    gh.singleton<_i136.IMoreRepository>(
        () => _i136.MoreRepository(gh<_i459.IMoreRemoteSource>()));
    gh.factory<_i267.IAccountRepository>(
        () => _i267.AccountRepository(gh<_i981.IAccountRemoteSource>()));
    gh.factory<_i433.IHomeRepository>(
        () => _i433.HomeRepository(gh<_i116.IHomeRemoteSource>()));
    gh.factory<_i82.CommentsUseCase>(
        () => _i82.CommentsUseCase(gh<_i433.IHomeRepository>()));
    gh.factory<_i242.GetPeopleUseCase>(
        () => _i242.GetPeopleUseCase(gh<_i433.IHomeRepository>()));
    gh.factory<_i678.GetPostsUseCase>(
        () => _i678.GetPostsUseCase(gh<_i433.IHomeRepository>()));
    gh.factory<_i403.GetStoriesUseCase>(
        () => _i403.GetStoriesUseCase(gh<_i433.IHomeRepository>()));
    gh.factory<_i71.TestFailureUseCase>(
        () => _i71.TestFailureUseCase(gh<_i433.IHomeRepository>()));
    gh.factory<_i1068.TestSuccessUseCase>(
        () => _i1068.TestSuccessUseCase(gh<_i433.IHomeRepository>()));
    gh.factory<_i30.TestValidatorUseCase>(
        () => _i30.TestValidatorUseCase(gh<_i433.IHomeRepository>()));
    gh.factory<_i902.LoginUseCase>(
        () => _i902.LoginUseCase(gh<_i267.IAccountRepository>()));
    gh.factory<_i832.RegisterUseCase>(
        () => _i832.RegisterUseCase(gh<_i267.IAccountRepository>()));
    gh.singleton<_i56.INotificationRepository>(() =>
        _i56.NotificationRepository(gh<_i1041.INotificationRemoteSource>()));
    gh.singleton<_i160.UploadFileUsecase>(
        () => _i160.UploadFileUsecase(gh<_i635.IUploadRepository>()));
    gh.singleton<_i359.AddOrUpdateFirebaseTokenUsecase>(() =>
        _i359.AddOrUpdateFirebaseTokenUsecase(
            gh<_i56.INotificationRepository>()));
    gh.singleton<_i313.ChangeNotificationStatusUsecase>(() =>
        _i313.ChangeNotificationStatusUsecase(
            gh<_i56.INotificationRepository>()));
    gh.singleton<_i199.GetNotificationsUsecase>(() =>
        _i199.GetNotificationsUsecase(gh<_i56.INotificationRepository>()));
    gh.factory<_i329.ReportProblemUsecase>(
        () => _i329.ReportProblemUsecase(gh<_i136.IMoreRepository>()));
    gh.singleton<_i301.CheckUpdateAppUsecase>(
        () => _i301.CheckUpdateAppUsecase(gh<_i136.IMoreRepository>()));
    return this;
  }
}

class _$SharedPreferencesModule extends _i128.SharedPreferencesModule {}

class _$LoggerModule extends _i101.LoggerModule {}
