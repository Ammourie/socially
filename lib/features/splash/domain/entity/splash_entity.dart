import '../../../../core/entities/base_entity.dart';
import '../../../more/domain/entity/version_entity.dart';

class SplashEntity extends BaseEntity {
  SplashEntity({
    required this.version,
  });

  final VersionEntity version;

  @override
  List<Object?> get props => [];
}
