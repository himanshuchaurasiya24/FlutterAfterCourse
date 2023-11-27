import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_style.dart';
import 'package:flutter/material.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppLayout.getSize(context).width,
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        decoration: const BoxDecoration(
          color: Color(0xff526799),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21),
            topRight: Radius.circular(21),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'NYC',
                        style:
                            Style.headlineStyle3.copyWith(color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        'London',
                        style:
                            Style.headlineStyle3.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
