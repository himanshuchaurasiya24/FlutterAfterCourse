import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ttb_flutter_firebase/ui/auth/sign_up_screen.dart';
import 'package:ttb_flutter_firebase/ui/firestore/firestore_list_screen.dart';
import 'package:ttb_flutter_firebase/ui/posts/post_screen.dart';
import 'package:ttb_flutter_firebase/utils/utilities.dart';
import 'package:ttb_flutter_firebase/widgets/round_button.dart';
import 'package:ttb_flutter_firebase/widgets/text_form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formField = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void logIn() {
    setState(() {
      isLoading = true;
    });
    _auth
        .signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      setState(() {
        isLoading = false;
      });
      Utils().toastMessage(
        value.user!.email.toString(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            // return PostScreen(
            //   email: value.user!.email.toString(),
            // );
            return const FirestoreScreen();
          },
        ),
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
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Login Screen'),
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
                  title: 'Login',
                  isLoading: isLoading,
                  onTap: () {
                    if (_formField.currentState!.validate()) {
                      logIn();
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ),
                        );
                      },
                      child: const Text('Sign up'),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          SystemNavigator.pop();
          return true;
        });
  }
}
