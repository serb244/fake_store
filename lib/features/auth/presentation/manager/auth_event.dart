part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthInitialEvent extends AuthEvent{
  @override
  List<Object> get props => [];

  const AuthInitialEvent();
}
class AuthUserChangeEvent extends AuthEvent{
   final UserModel userModel;
  @override
  List<Object> get props => [];

  const AuthUserChangeEvent({required this.userModel});
}
class AuthUserErrorEvent extends AuthEvent{
   final String error;
  @override
  List<Object> get props => [];

  const AuthUserErrorEvent({required this.error});
}

class AuthLogoutEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthLoginEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthRegisterEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthForgotPasswordEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthResetPasswordEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthUpdateProfileEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthGetProfileEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthGetTokenEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthGetRefreshTokenEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthUpdateTokenEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthUpdateRefreshTokenEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}
class AuthUpdateUserEvent extends AuthEvent{
  @override
  List<Object> get props => [];
}