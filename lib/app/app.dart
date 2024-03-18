import 'package:cwiecznie_2/app/cubit/root_cubit.dart';
import 'package:cwiecznie_2/app/features/home/home_page.dart';
import 'package:cwiecznie_2/app/features/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {

            final user = state.user;
                if (user == null) {
                  return LoginPage();
                }
                return HomePage(user: user);
        },
      ),
    );
  }
}
