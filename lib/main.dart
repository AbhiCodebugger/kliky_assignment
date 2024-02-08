import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kliky_assignment/core/local/local_repository_impl.dart';
import 'package:kliky_assignment/data/repository/health_repository_impl.dart';
import 'package:kliky_assignment/domain/usecase/health_usecase.dart';
import 'package:kliky_assignment/presentation/view/home_screen.dart';

import 'presentation/bloc/health_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HealthBloc(
        HealthUseCase(
          HealthRepositoryImpl(
            LocalRepositoryImpl(),
          ),
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
