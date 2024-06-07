import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user/auth_model.dart';
import '../../data/models/user/user_model.dart';
import '../../domain/repository/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserState(userModel: UserModel.guest())) {
    on<UserInitialEvent>(_init);
  }

  _init(UserInitialEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));
    final res = await userRepository.getLocalUser();
    res.fold(
      (l) => emit(state.copyWith(error: l.userMessage.toString())),
      (r) => r is UserModel ? emit(state.copyWith(userModel: r)) : emit(state.copyWith()),
    );
  }
}
