import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_errors.dart';
import '../model/request/upload_file_param.dart';
import '../model/response/url_model.dart';

import '../../../../core/datasources/remote_data_source.dart';

part 'upload_remote.dart';

abstract class IUploadRemoteSource extends RemoteDataSource {
  Future<Either<AppErrors, UrlModel>> uploadFile(UploadFileParam param);
}
