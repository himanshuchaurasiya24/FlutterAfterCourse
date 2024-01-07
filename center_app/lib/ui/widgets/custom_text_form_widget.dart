import 'package:flutter/material.dart';

class CustomTextFormWidget extends StatelessWidget {
  const CustomTextFormWidget(
      {super.key,
      required TextEditingController emailController,
      required this.dataType,
      this.textInputType})
      : _emailController = emailController;

  final TextEditingController _emailController;
  final String dataType;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text('Enter $dataType here'),
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter $dataType';
        }
        return null;
      },
    );
  }
}
