import 'package:fake_store/core/data/models/user/user_model.dart';

import 'package:fake_store/core/error/exceptions.dart';

import 'package:fpdart/src/either.dart';

import '../../../generated/l10n.dart';
import '../../domain/repository/user_repository.dart';
import '../data_sources/local/user_local_data_source.dart';

class UserRepositoryImpl extends  UserRepository {
  final UserLocalDataSource userLocalDataSource;
  UserModel _userModel = UserModel.guest();
   UserRepositoryImpl({required this.userLocalDataSource});
  @override
  Future<Either<BaseException, bool>> deleteLocalUser() {
    // TODO: implement deleteLocalUser
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseException, UserModel?>> getLocalUser()async {
    try {
      final res = await userLocalDataSource.getLocalUser();
      _userModel = res ?? UserModel.guest();
      addToStream(_userModel);
      res is UserModel ? _userModel = res : null;
      return Right(res);
    }on BaseException catch (e) {
      return Left(e);
    }
    catch (e) {
      // TODO: implement catch
      return Left(LocalDataException(
          stackTrace: StackTrace.current, userMessage: S.current.error_unknown, systemMessage: S.current.anErrorOccurredWhileDecodingJson));
    }
  }

  @override
  Future<Either<BaseException, bool>> saveLocalUser(UserModel userModel) {
    // TODO: implement saveLocalUser
    throw UnimplementedError();
  }
  
}