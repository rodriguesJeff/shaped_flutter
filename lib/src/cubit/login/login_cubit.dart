import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String _email = '';
  void setEmail(String value) => _email = value;
  bool get isEmailValid => _email.isNotEmpty && _email.contains('@');

  String _password = '';
  void setPassword(String value) => _password = value;
  bool get isPasswordValid => _password.isNotEmpty;

  bool get isFormValid => isEmailValid && isPasswordValid;

  login() async {
    emit(LoginLoading());
    if (_email == 'user@shaped.com.br' && _password == '123456') {
      Future.delayed(const Duration(seconds: 5));
      emit(LoginInitial());
      return true;
    } else {
      emit(LoginInitial());
      Fluttertoast.showToast(
        msg: 'Credenciais inválidas, tente novamente!',
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.amber,
      );
    }
  }
}
