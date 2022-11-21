import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shaped_flutter/src/cubit/home/home_cubit.dart';

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
        elevation: 0,
        title: const Text('Bem-Vindo ao Shaped'),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is HomeInitial) _cubit.getPatientStatusModel();
        if (state is HomeLoaded) {
          return Container();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
