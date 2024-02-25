import 'package:flutter/material.dart';

class CustomDatePickerFormField extends StatelessWidget {
  final VoidCallback callBack;
    final TextEditingController controller;
    final String txtLabel;
  const CustomDatePickerFormField({required this.callBack,required this.controller, required this.txtLabel,  super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      decoration:  InputDecoration(
        border:   const OutlineInputBorder(
          
        ),
        label:  Text(txtLabel),
      ),
      validator: (value) {
        if(value==null || value.isEmpty){
          return '$txtLabel can not be empty';
        }
        return null;
      },
      onTap: callBack,
    );
  }
  
}