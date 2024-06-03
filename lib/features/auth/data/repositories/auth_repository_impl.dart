import 'package:fake_store/core/data/models/auth/auth_model.dart';
import 'package:fake_store/core/data/user/user_model.dart';
import 'package:fake_store/core/error/exceptions.dart';
import 'package:fpdart/fpdart.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<BaseException, AuthModel>> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseException, (UserModel, AuthModel)>> register({required String email, required String password}) async {
    try  {
      final  (UserModel, AuthModel) response =await  authRemoteDataSource.register(email: email, password: password);
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
}
