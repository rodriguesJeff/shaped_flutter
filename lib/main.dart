import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shaped_flutter/src/cubit/login/login_cubit.dart';
import 'package:shaped_flutter/src/pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: BlocProvider.value(
        value: LoginCubit(),
        child: const LoginPage(),
      ),
    );
  }
}
