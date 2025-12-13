import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class GoogleSignInEvent extends AuthEvent {}

class EmailSignInEvent extends AuthEvent {
  final String email;
  final String password;
  const EmailSignInEvent({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}

class EmailSignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const EmailSignUpEvent({required this.name, required this.email, required this.password});
  @override
  List<Object?> get props => [name, email, password];
}

class SignOutEvent extends AuthEvent {}
