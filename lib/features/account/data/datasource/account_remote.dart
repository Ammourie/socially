part of 'iaccount_remote.dart';

@Injectable(as: IAccountRemoteSource)
class AccountRemoteSource extends IAccountRemoteSource {
  @override
  Future<Either<AppErrors, LoginModel>> login(LoginRequest loginRequest) async {
    await Future.delayed(const Duration(seconds: 2));
    if (loginRequest.phoneNumber == "0931607158" &&
        loginRequest.password == "12345678") {
      return Right(
        LoginModel(
          account: AccountModel(
            name: 'Issa Kalloumah',
            id: "1",
            imageUrl: "",
          ),
          token: "token123",
        ),
      );
    } else
      return const Left(CustomError(message: "Phone or password is wrong."));
    // return await request<LoginModel, dynamic, Object>(
    //   converter: (json) => LoginModel.fromMap(json),
    //   method: HttpMethod.POST,
    //   url: "ACCOUNT_LOGIN",
    //   body: loginRequest.toMap(),
    //   cancelToken: loginRequest.cancelToken,
    // );
  }

  @override
  Future<Either<AppErrors, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    return await request<RegisterModel>(
      converter: (json) => RegisterModel.fromMap(json),
      method: HttpMethod.POST,
      url: "ACCOUNT_REGISTER",
      body: registerRequest.toMap(),
      cancelToken: registerRequest.cancelToken,
    );
  }
}
