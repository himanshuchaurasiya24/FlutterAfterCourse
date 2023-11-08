
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController controller, required this.txtlable,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String txtlable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: const  OutlineInputBorder(
          
        ),
        label: Text(txtlable),
      ),
      validator: (value) {
        if(value==null || value.isEmpty){
          return '$txtlable can not be empty';
        }
        return null;
      },
    );
  }
}