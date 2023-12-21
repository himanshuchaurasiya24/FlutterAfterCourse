import 'package:flutter/material.dart';

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
