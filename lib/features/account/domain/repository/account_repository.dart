part of 'iaccount_repository.dart';

@Injectable(as: IAccountRepository)
class AccountRepository extends IAccountRepository {
  final IAccountRemoteSource remoteDataSource;

  AccountRepository(this.remoteDataSource);

  @override
  Future<Result<AppErrors, LoginEntity>> login(
      LoginRequest loginRequest) async {
    final remote = await remoteDataSource.login(loginRequest);
    return execute<LoginModel, LoginEntity>(remoteResult: remote);
  }

  @override
  Future<Result<AppErrors, RegisterEntity>> register(
    RegisterRequest registerRequest,
  ) async {
    final remote = await remoteDataSource.register(registerRequest);
    return execute<RegisterModel, RegisterEntity>(remoteResult: remote);
  }
}
