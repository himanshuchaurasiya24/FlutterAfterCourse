import 'package:booktickets/utils/app_style.dart';
import 'package:flutter/material.dart';

class DoubleTextWidget extends StatelessWidget {
  const DoubleTextWidget({
    super.key,
    required this.bigText,
    required this.smallText,
  });
  final String bigText;
  final String smallText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,
          style: Style.headlineStyle1,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            smallText,
            style: Style.textStyle.copyWith(color: Style.primaryColor),
          ),
        ),
      ],
    );
  }
}
