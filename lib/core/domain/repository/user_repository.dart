import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../../data/models/user/user_model.dart';
import '../../error/exceptions.dart';

abstract class UserRepository {
  final _controller = StreamController<UserModel>();

  Stream<UserModel> get userModel => _controller.stream.asBroadcastStream();

  void addToStream(UserModel userModel) => _controller.sink.add(userModel);

  Future<Either<BaseException, UserModel?>> getLocalUser();

  Future<Either<BaseException, bool>> saveLocalUser(UserModel userModel);

  Future<Either<BaseException, bool>> deleteLocalUser();
}
