import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ttb_flutter_firebase/ui/auth/login_screen.dart';
import 'package:ttb_flutter_firebase/utils/utilities.dart';
import 'package:ttb_flutter_firebase/widgets/round_button.dart';
import 'package:ttb_flutter_firebase/widgets/text_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formField = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUp() {
    setState(() {
      isLoading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      setState(() {
        isLoading = false;
      });
      Utils().toastMessage(
        value.user.toString(),
      );
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
      Utils().toastMessage(
        error.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formField,
              child: Column(
                children: [
                  TextFormWidget(
                    emailController: emailController,
                    icon: Icons.email,
                    isObscure: false,
                    labelText: 'Email',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormWidget(
                    emailController: passwordController,
                    icon: Icons.password,
                    isObscure: true,
                    labelText: 'Password',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RoundButton(
              title: 'Sign Up',
              isLoading: isLoading,
              onTap: () {
                if (_formField.currentState!.validate()) {
                  signUp();
                }
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  child: const Text('Log in'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
