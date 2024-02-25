import 'package:booktickets/utils/app_style.dart';
import 'package:flutter/material.dart';

class ColumnTextLayout extends StatelessWidget {
  const ColumnTextLayout({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.crossAxisAlignment,
  });
  final String firstText;
  final String secondText;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          firstText,
          style: Style.headlineStyle3,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          secondText,
          style: Style.headlineStyle4,
        )
      ],
    );
  }
}
