import 'package:equatable/equatable.dart';

import '../../entitys/user.dart';

abstract class LoginState extends Equatable {

  @override
  // TODO: implement props
  List<Object?> get props => [];

  LoginState();
}
class LoginInit extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final User user;
  LoginSuccess(this.user);
  @override
  // TODO: implement props
  List<Object?> get props => [user];

}
class LoginFailed extends LoginState {
  final String? message;
  LoginFailed(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

