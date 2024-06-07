import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:fake_store/core/data/models/user/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/models/user/auth_model.dart';
import '../../../../core/domain/repository/user_repository.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

///Юзер будет всегда - его на старте получает userBloc  и передает в AuthBloc
/// 1 - Guest - при первом запуске, или когда нет записи в Local Storage
/// 2 - userName - когда есть запись в Local Storage, но статус не аутентифицирован - предложить аутентификацию
/// 3 - userName - когда есть запись в Local Storage и статус аутентифицирован - предложить выход
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  late final StreamSubscription _subscription;

  AuthBloc({required this.authRepository, required this.userRepository}) : super(const AuthState()) {
    on<AuthInitialEvent>(_init);
    on<AuthLoginEvent>(_onAuthLoginEvent);
    on<AuthRegisterEvent>(_onAuthRegisterEvent);
    on<AuthLogoutEvent>(_onAuthLogoutEvent);
    on<AuthUserChangeEvent>(_onAuthUserChangeEvent);
    on<AuthUserErrorEvent>(_onAuthUserErrorEvent);
    _subscribe();
  }

  _onAuthUserErrorEvent(AuthUserErrorEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(authStatus: AuthStatus.unauthenticated, userModel: null));
  }

  _onAuthUserChangeEvent(AuthUserChangeEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(authStatus: AuthStatus.authenticated));
  }

  void _subscribe() {
    _subscription = userRepository.userModel.listen(
      (userModel) => AuthUserChangeEvent(userModel: userModel),
      onError: (error) => AuthUserErrorEvent(error: error.toString()),
    );
  }

  _onAuthLogoutEvent(AuthLogoutEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(authStatus: AuthStatus.unauthenticated, userModel: null));
  }

  _onAuthLoginEvent(AuthLoginEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      authStatus: AuthStatus.authenticated,
    ));
  }

  _onAuthRegisterEvent(AuthRegisterEvent event, Emitter<AuthState> emit) {
    // return const AuthState(authStatus: AuthStatus.authenticated, user: UserModel());
  }

  _init(AuthInitialEvent event, Emitter<AuthState> emit) {
    print("AuthInitialEvent: ${state.authStatus}");
    emit(state.copyWith(isLoading: true));
    Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
    // user == null
    //     ? emit(state.copyWith(authStatus: AuthStatus.unauthenticated))
    //     : emit(state.copyWith(authStatus: AuthStatus.authenticated));
  }
}
