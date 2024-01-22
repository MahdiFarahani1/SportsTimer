import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sporttimer/main_feature/presentation/screens/home_page.dart';
import 'package:sporttimer/main_feature/presentation/screens/timer_screen.dart';
import 'package:sporttimer/main_feature/presentation/state_bloc/plus_mines_cubit/cubit/counter_cubit.dart';
import 'package:sporttimer/main_feature/presentation/state_bloc/start_timer_cubit.dart/cubit/start_timer_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => StartTimerCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: GoRouter(routes: [
          GoRoute(path: "/", builder: (context, state) => const MyHomePage()),
          GoRoute(
              path: TimerPage.routeName,
              builder: (context, state) => const TimerPage()),
        ]),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
