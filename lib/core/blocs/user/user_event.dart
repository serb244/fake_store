part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();
}

class UserInitialEvent extends UserEvent {
  @override
  List<Object> get props => [];

  const UserInitialEvent();
}
class  UserSaveEvent extends UserEvent {
  final UserModel userModel;
  const UserSaveEvent({required this.userModel});
  @override
  List<Object> get props => [ userModel ];
}
class UserGetEvent extends UserEvent {
  @override
  List<Object> get props => [];
}
class UserDeleteEvent extends UserEvent {
  @override
  List<Object> get props => [];
}