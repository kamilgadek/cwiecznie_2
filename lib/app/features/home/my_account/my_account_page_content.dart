import 'package:cwiecznie_2/app/cubit/root_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('Jesteś zalogowany jak $email'),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            context.read<RootCubit>().signOut();
          },
          child: const Text('Wyloguj'),
        ),
      ],
    );
  }
}