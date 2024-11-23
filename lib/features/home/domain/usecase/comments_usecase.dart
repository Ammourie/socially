import 'package:injectable/injectable.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/params/no_params.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/core/usecases/usecase.dart';
import 'package:starter_application/features/home/domain/entity/comments_entity.dart';
import 'package:starter_application/features/home/domain/repository/ihome_repository.dart';

@injectable
class CommentsUseCase extends UseCase<List<CommentsEntity>, NoParams> {
  final IHomeRepository iHomeRepository;

  CommentsUseCase(this.iHomeRepository);

  @override
  Future<Result<AppErrors, List<CommentsEntity>>> call(NoParams params) async =>
      await iHomeRepository.getComments();
}
