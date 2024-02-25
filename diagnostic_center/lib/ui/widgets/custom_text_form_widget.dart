import 'package:flutter/material.dart';

class CustomTextFormWidget extends StatelessWidget {
  const CustomTextFormWidget(
      {super.key,
      required TextEditingController controller,
      required this.dataType,
      required this.isString,
      this.textInputType})
      : _controller = controller;

  final TextEditingController _controller;
  final String dataType;
  final TextInputType? textInputType;
  final bool isString;
  bool isInt(var data) {
    return data is int;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
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
