import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/story_entity.dart';
import '../repository/ihome_repository.dart';

@injectable
class GetStoriesUseCase extends UseCase<List<StoryEntity>, NoParams> {
  final IHomeRepository iHomeRepository;

  GetStoriesUseCase(this.iHomeRepository);

  @override
  Future<Result<AppErrors, List<StoryEntity>>> call(NoParams params) async =>
      await iHomeRepository.getStories(params);
}
