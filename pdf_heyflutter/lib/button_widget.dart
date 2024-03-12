import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, required this.onClicked});
  final String text;
  final VoidCallback onClicked;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(40),
      ),
      onPressed: onClicked,
      child: FittedBox(
        child: Text(text),
      ),
    );
  }
}
