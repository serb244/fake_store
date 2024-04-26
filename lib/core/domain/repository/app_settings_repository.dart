import 'package:fpdart/fpdart.dart';

import '../../data/models/app_settings/app_settings.dart';
import '../../error/exceptions.dart';

abstract class AppSettingsRepository {
  Stream<Either<BaseException,AppSettings?>> get appSettingsStream ;
  Future<Either<BaseException, bool>> saveAppSettingsLocal({required AppSettings appSettings, bool force = true});
  Future<Either<BaseException, AppSettings?>> getAppSettings({  bool force = false});
}
