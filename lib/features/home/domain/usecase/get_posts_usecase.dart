import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/post_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class GetPostsUseCase extends UseCase<List<PostEntity>, NoParams> {
  final IHomeRepository iHomeRepository;

  GetPostsUseCase(this.iHomeRepository);

  @override
  Future<Result<AppErrors, List<PostEntity>>> call(NoParams params) async =>
      await iHomeRepository.getPosts(params);
}
