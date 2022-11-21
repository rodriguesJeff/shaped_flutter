// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shaped_flutter/src/cubit/home/home_cubit.dart';
import 'package:shaped_flutter/src/cubit/login/login_cubit.dart';
import 'package:shaped_flutter/src/pages/home/home_page.dart';
import 'package:shaped_flutter/src/pages/login/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _cubit = context.read<LoginCubit>();
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 16.0),
                Image.network(
                  'https://www.shaped.com.br/static/assets/img/logo/SHAPED2-07.png',
                  width: MediaQuery.of(context).size.width * .5,
                ),
                const SizedBox(height: 16.0),
                TextFieldWidget(
                  onChanged: _cubit.setEmail,
                  hintText: 'E-mail',
                  icon: Icons.email,
                ),
                const SizedBox(height: 16.0),
                TextFieldWidget(
                  onChanged: _cubit.setPassword,
                  hintText: 'Senha',
                  icon: Icons.lock,
                  obscuredText: true,
                ),
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () async {
                    if (_cubit.isFormValid) {
                      final result = await _cubit.login();
                      if (result == true) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider.value(
                              value: HomeCubit(),
                              child: const HomePage(),
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: state is LoginLoading
                          ? const CircularProgressIndicator(
                              color: Colors.black,
                            )
                          : const Text('ENTRAR'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
