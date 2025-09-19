import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/blocs/login/login_bloc.dart';
import 'package:login_app_bloc/blocs/login/login_event.dart';
import 'package:login_app_bloc/blocs/login/login_state.dart';
import 'package:login_app_bloc/screens/list_contact_screen.dart';
import 'package:login_app_bloc/widgets/buttons/Custome_loginbutton.dart';
import 'package:login_app_bloc/widgets/inputs/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userNameTextEditing = TextEditingController();
  var passWordTextEditing = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Login thành công!")));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ListContactScreen(user: state.user),
              ),
            );
            userNameTextEditing.clear();
            passWordTextEditing.clear();
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Thất bại")));
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: "UserName",
                obcureText: false,
                controller: userNameTextEditing,
              ),
              SizedBox(height: 20),
              CustomTextField(
                hintText: "Password",
                obcureText: true,
                controller: passWordTextEditing,
              ),
              SizedBox(height: 20),
              CustomeLoginbutton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                    LoginButtonPress(
                      userNameTextEditing.text,
                      passWordTextEditing.text,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
