import 'package:flutter/material.dart';
import 'package:ttb_flutter_firebase/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formField = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: () {
                if (_formField.currentState!.validate()) {}
              },
            )
          ],
        ),
      ),
    );
  }
}

class TextFormWidget extends StatelessWidget {
  const TextFormWidget({
    super.key,
    required this.emailController,
    required this.labelText,
    required this.icon,
    required this.isObscure,
  });
  final String labelText;
  final IconData icon;
  final bool isObscure;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter $labelText';
        }
        return null;
      },
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: labelText,
        icon: Icon(icon),
      ),
    );
  }
}
