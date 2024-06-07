import 'package:fake_store/core/data/models/user/auth_model.dart';
import 'package:fake_store/core/error/exceptions.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/data/models/user/user_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<BaseException, UserModel>> login({required String email, required String password}) async {
    try {
      final UserModel response = await authRemoteDataSource.login(email: email, password: password);
      return right(response);
    } on BaseException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<BaseException, UserModel>> register({required String email, required String password, required String username}) async {
    try {
      final UserModel response = await authRemoteDataSource.register(email: email, password: password, username: username);
      return right(response);
    } on BaseException catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<BaseException, UserModel>> getLocalUser() {
    // TODO: implement getLocalUser
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseException, bool>> deleteLocalUser() {
    // TODO: implement deleteLocalUser
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseException, bool>> isUserAdmin() {
    // TODO: implement isUserAdmin
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseException, bool>> saveLocalUser(UserModel userModel) {
    // TODO: implement saveLocalUser
    throw UnimplementedError();
  }
}
