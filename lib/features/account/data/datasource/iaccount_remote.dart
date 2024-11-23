import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/enums/http_method.dart';
import '../../../../core/datasources/remote_data_source.dart';
import '../../../../core/errors/app_errors.dart';
import '../request/model/login_model.dart';
import '../request/model/register_model.dart';
import '../request/param/login_request.dart';
import '../request/param/register_request.dart';

part 'account_remote.dart';

abstract class IAccountRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, LoginModel>> login(LoginRequest loginRequest);

  Future<Either<AppErrors, RegisterModel>> register(
      RegisterRequest registerRequest);
}
