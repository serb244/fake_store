import 'package:fpdart/fpdart.dart';

import '../../../../core/data/models/auth/auth_model.dart';
import '../../../../core/data/user/user_model.dart';
import '../../../../core/error/error.dart';

abstract class AuthRepository {
  Future<Either<BaseException, AuthModel>> login({required String email, required String password});
  Future<Either<BaseException, (UserModel, AuthModel)>>register({required String email, required String password});
  Future<Either<BaseException, UserModel>> getLocalUser();
}
