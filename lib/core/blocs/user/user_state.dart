part of 'user_bloc.dart';

class UserState extends Equatable {
  final UserModel userModel;
  final String? error;
  final bool isLoading;

  const UserState({required this.userModel, this.error, this.isLoading = false});

  @override
  List<Object?> get props => [userModel, error, isLoading];

  UserState copyWith({
    UserModel? userModel,
    String? error,
    bool isLoading = false,
  }) {
    return UserState(
      userModel: userModel ?? this.userModel,
      error: error ?? this.error,
      isLoading: isLoading,
    );
  }
}
