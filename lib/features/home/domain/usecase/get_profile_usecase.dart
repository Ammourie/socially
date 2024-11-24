import 'package:injectable/injectable.dart';
import 'package:socially/features/home/domain/repository/ihome_repository.dart';

import '../../../../core/errors/app_errors.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/results/result.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/profile_entity.dart';

@injectable
class GetProfileUseCase implements UseCase<ProfileEntity, NoParams> {
  final IHomeRepository repository;

  GetProfileUseCase(this.repository);

  @override
  Future<Result<AppErrors, ProfileEntity>> call(NoParams params) async {
    return await repository.getProfile(params);
  }
}
