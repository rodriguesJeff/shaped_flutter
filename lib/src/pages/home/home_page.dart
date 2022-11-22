import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shaped_flutter/src/cubit/home/home_cubit.dart';
import 'package:shaped_flutter/src/cubit/login/login_cubit.dart';
import 'package:shaped_flutter/src/pages/login/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text('Bem-Vindo ao Shaped'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (c) => BlocProvider.value(
                    value: LoginCubit(),
                    child: const LoginPage(),
                  ),
                ),
                (route) => false),
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is HomeInitial) _cubit.getPatientStatusModel();
        if (state is HomeLoaded) {
          return Column(
            children: [
              const SizedBox(height: 8.0),
              for (final s in state.status) ...[
                const SizedBox(height: 8.0),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (c) {
                          return AlertDialog(
                            title: Center(
                              child: Text(
                                'Resumo do Exame do(a)\n${s.paciente}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            content: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Status:'),
                                      Text(
                                        s.status ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: s.status == 'Finalizado'
                                              ? Colors.green
                                              : Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        color: s.status == 'Finalizado'
                            ? Colors.green
                            : Colors.amber,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Data:'),
                                Text(
                                  s.data ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Nome:'),
                                Text(
                                  s.paciente ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
              ]
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
