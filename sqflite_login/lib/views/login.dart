import 'package:flutter/material.dart';
import 'package:sqflite_login/SQLite/database_helper.dart';
import 'package:sqflite_login/SQLite/json.dart';
import 'package:sqflite_login/components/button.dart';
import 'package:sqflite_login/components/textfield.dart';
import 'package:sqflite_login/views/home.dart';
import 'package:sqflite_login/views/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLogin = false;
  bool isValidated = false;
  final _formKey = GlobalKey<FormState>();
  final DatabaseHelper db = DatabaseHelper();
  login() async {
    var res = await db.authenticate(
      Users(
        userName: _usernameController.text,
        password: _passwordController.text,
      ),
    );
    if (res == true) {
      if (!mounted) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        ),
      );
    } else {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 14),
                height: size.height * 0.7,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 0,
                      color: Colors.grey,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text('Welcome'),
                          subtitle: Text(
                              'Enter your credentials to access your vital'),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              InputField(
                                onSubmitted: login,
                                hintText: 'username',
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'username is required';
                                  }
                                  return null;
                                },
                                icon: Icons.account_circle_rounded,
                                controller: _usernameController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InputField(
                                onSubmitted: login,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'password is required';
                                  }
                                  return null;
                                },
                                hintText: 'password',
                                icon: Icons.password_rounded,
                                controller: _passwordController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Button(
                          title: 'Log In',
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                              setState(() {
                                isValidated = false;
                              });
                            } else {
                              setState(() {
                                isValidated = true;
                              });
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const Signup();
                                    },
                                  ),
                                );
                              },
                              child: const Text('Register'),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Forgot password?'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        messages(),
                      ],
                    ),
                  ),
                ),
              ),
              Image.asset('assets/login.gif')
            ],
          ),
        ),
      ),
    );
  }

  Widget messages() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          isLogin
              ? const Text(
                  'Access is denied! username or password is incorrect.')
              : const SizedBox(),
          isValidated
              ? const Text('Form is not validated. Please check above.')
              : const SizedBox(),
        ],
      ),
    );
  }
}
