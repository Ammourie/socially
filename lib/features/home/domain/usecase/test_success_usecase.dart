import 'package:injectable/injectable.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/models/empty_response.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/core/usecases/usecase.dart';
import 'package:starter_application/features/home/data/request/param/mock_request.dart';
import 'package:starter_application/features/home/domain/repository/ihome_repository.dart';

@injectable
class TestSuccessUseCase extends UseCase<EmptyResponse, MockRequest> {
  final IHomeRepository iHomeRepository;

  TestSuccessUseCase(this.iHomeRepository);

  @override
  Future<Result<AppErrors, EmptyResponse>> call(MockRequest params) async =>
      await iHomeRepository.testSuccess(params);
}
