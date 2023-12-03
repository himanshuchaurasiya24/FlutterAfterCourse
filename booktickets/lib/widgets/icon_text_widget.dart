import 'package:booktickets/utils/app_style.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    super.key,
    required this.label,
    required this.iconData,
  });
  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: const Color(0xffbfc3df),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            label,
            style: Style.textStyle,
          )
        ],
      ),
    );
  }
}
