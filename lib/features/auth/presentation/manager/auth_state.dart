part of 'auth_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final String? error;
  final bool isLoading;
  final UserModel? userModel;

  const AuthState({ this.error, this.userModel, this.authStatus = AuthStatus.unauthenticated, this.isLoading = false});

  AuthState copyWith({
    AuthStatus? authStatus,
    String? error,
    bool isLoading = false,
    UserModel? userModel,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      error: error ?? this.error,
      isLoading: isLoading,
      userModel:  userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [authStatus, error, isLoading, userModel];

  @override
  String toString() {
    return 'AuthState{authStatus: $authStatus, error: $error, isLoading: $isLoading, userModel: $userModel}';
  }
}
