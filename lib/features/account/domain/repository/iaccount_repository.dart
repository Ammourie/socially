import 'package:injectable/injectable.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/repositories/repository.dart';
import '../../../../core/results/result.dart';
import '../../data/datasource/iaccount_remote.dart';
import '../../data/request/model/login_model.dart';
import '../../data/request/model/register_model.dart';
import '../../data/request/param/login_request.dart';
import '../../data/request/param/register_request.dart';
import '../entity/login_entity.dart';
import '../entity/register_entity.dart';

part 'account_repository.dart';

abstract class IAccountRepository extends Repository {
  Future<Result<AppErrors, LoginEntity>> login(LoginRequest loginRequest);

  Future<Result<AppErrors, RegisterEntity>> register(
      RegisterRequest registerRequest);
}
