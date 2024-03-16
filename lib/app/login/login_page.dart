import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    super.key,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAcount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isCreatingAcount == true ? 'Zarejestruj się' : 'Zaloguj się'),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'e-mail'),
              controller: widget.emailController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'password'),
              controller: widget.passwordController,
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(errorMessage),
            ElevatedButton(
              onPressed: () async {
                //rejestracja
                if (isCreatingAcount == true) {
                  try {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                    );
                  } catch (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                  }
                  // logowanie
                } else {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                    );
                  } catch (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                  }
                }
              },
              child: Text(
                  isCreatingAcount == true ? 'Zarejestruj się' : 'Zaloguj się'),
            ),
            const SizedBox(
              height: 20,
            ),
            if (isCreatingAcount == false) ...[
              TextButton(
                onPressed: () {
                  setState(() {
                    isCreatingAcount = true;
                  });
                },
                child: const Text('Utwórz konto'),
              ),
            ],
            if (isCreatingAcount == true) ...[
              TextButton(
                onPressed: () {
                  setState(() {
                    isCreatingAcount = false;
                  });
                },
                child: const Text('Masz juz konto?'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
