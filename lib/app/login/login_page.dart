import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Zaloguj się'),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'e-mail'),
              controller: emailController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'password'),
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                } catch (error) {
                  print(error);
                }
              },
              child: const Text('Zaloguj się'),
            ),
          ],
        ),
      ),
    );
  }
}
