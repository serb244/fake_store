import 'package:fpdart/fpdart.dart';

import '../../../../core/data/models/user/auth_model.dart';
import '../../../../core/data/models/user/user_model.dart';
import '../../../../core/error/error.dart';

abstract class AuthRepository {
  Future<Either<BaseException, UserModel>> login({required String email, required String password});
  Future<Either<BaseException, UserModel>>register({required String email, required String password, required String username});
  Future<Either<BaseException, UserModel>> getLocalUser();
  Future<Either<BaseException, bool>> saveLocalUser(UserModel userModel);
  Future<Either<BaseException, bool>> deleteLocalUser();
  Future<Either<BaseException, bool>> isUserAdmin();
}
