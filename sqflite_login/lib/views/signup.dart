import 'package:flutter/material.dart';
import 'package:sqflite_login/SQLite/database_helper.dart';
import 'package:sqflite_login/SQLite/json.dart';
import 'package:sqflite_login/components/button.dart';
import 'package:sqflite_login/components/textfield.dart';
import 'package:sqflite_login/views/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();

  bool isValidated = false;
  final _formKey = GlobalKey<FormState>();
  final DatabaseHelper db = DatabaseHelper();
  register() async {
    var res = await db.createUser(
      Users(
        fullName: _fullNameController.text,
        userName: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
    if (res > 0) {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const Login();
          },
        ),
      );
    } else {}
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
                          title: Text('Register'),
                          subtitle: Text('Signup to create new account'),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              InputField(
                                onSubmitted: register,
                                hintText: 'Full Name',
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Full name is required';
                                  }
                                  return null;
                                },
                                icon: Icons.person,
                                controller: _fullNameController,
                              ),
                              InputField(
                                hintText: 'Username',
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Username is required';
                                  }
                                  return null;
                                },
                                icon: Icons.account_circle_rounded,
                                controller: _usernameController,
                                onSubmitted: register,
                              ),
                              InputField(
                                onSubmitted: register,
                                hintText: 'Email',
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Email is required';
                                  }
                                  return null;
                                },
                                icon: Icons.email,
                                controller: _emailController,
                              ),
                              InputField(
                                onSubmitted: register,
                                trailing: const Icon(Icons.visibility_off),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
                                hintText: 'Password',
                                icon: Icons.password_rounded,
                                controller: _passwordController,
                              ),
                              InputField(
                                onSubmitted: register,
                                trailing: const Icon(Icons.visibility_off),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Confirm password is required';
                                  } else if (_passwordController.text !=
                                      _confirmPasswordController.text) {
                                    return 'Password don\'t match';
                                  }
                                  return null;
                                },
                                hintText: 'Confirm password',
                                icon: Icons.password_rounded,
                                controller: _confirmPasswordController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Button(
                          title: 'Sign up',
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              register();
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
                            const Text('Already have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const Login();
                                    },
                                  ),
                                );
                              },
                              child: const Text('Login instead'),
                            ),
                          ],
                        ),
                        messages(),
                      ],
                    ),
                  ),
                ),
              ),
              Image.asset('assets/signup.gif')
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
          isValidated
              ? const Text('Form is not validated. Please check above.')
              : const SizedBox(),
        ],
      ),
    );
  }
}
