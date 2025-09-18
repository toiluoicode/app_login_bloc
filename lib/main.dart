import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_app_bloc/blocs/login/login_bloc.dart';
import 'package:login_app_bloc/screens/login_screen.dart';
import 'package:login_app_bloc/storage/app_data.dart';

void main()   {
  // WidgetsFlutterBinding.ensureInitialized();
  // await AppData.initData();
  runApp(
    MultiBlocProvider(
        providers: [
          BlocProvider(create:  (context)=> LoginBloc()),
        ],
        child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
