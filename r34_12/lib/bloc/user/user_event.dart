
import 'package:equatable/equatable.dart';
import 'package:market_app/model/user_model.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent extends UserEvent {
  final UserModel user;

  const LoginUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class LoadUserEvent extends UserEvent {
  final String userId;

  const LoadUserEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}

class UpdateUserEvent extends UserEvent {
  final UserModel user;

  const UpdateUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class LogoutUserEvent extends UserEvent {}