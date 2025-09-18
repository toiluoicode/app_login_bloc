import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/blocs/login/login_event.dart';
import 'package:login_app_bloc/blocs/login/login_state.dart';
import 'package:login_app_bloc/entitys/user.dart';
import 'package:login_app_bloc/mock/mock_data.dart';
import 'package:login_app_bloc/storage/user_storage.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInit()) {
    on<LoginButtonPress>(_onPressLoginButton);
    on<LoginReset>(_onResetLogin);
  }
  Future<void> _onPressLoginButton(
    LoginButtonPress event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
      final List<User> users = await UserStorage.loadUsers();
      final User user = users.firstWhere(
        (u) => u.userName == event.userName && u.passWord == event.passWord,
      );
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailed(null));
    }
  }
  void _onResetLogin(LoginReset event, Emitter<LoginState> emit) {
    emit(LoginInit());
  }
}
