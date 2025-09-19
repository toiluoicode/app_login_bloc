import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  final String userName;
  final String passWord;
  const LoginEvent(this.userName, this.passWord);
  @override
  List<Object?> get props => [userName,passWord];
}
class LoginButtonPress extends LoginEvent{
  LoginButtonPress(super.userName, super.passWord);
}
