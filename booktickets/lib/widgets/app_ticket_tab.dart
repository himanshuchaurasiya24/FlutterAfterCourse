import 'package:flutter/material.dart';

class AppTicketTab extends StatelessWidget {
  const AppTicketTab(
      {super.key, required this.firstTab, required this.secondTab});
  final String firstTab;
  final String secondTab;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color(0xfff4f6fd),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              width: size.width * 0.44,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
                color: Colors.white,
              ),
              child: Center(child: Text(firstTab)),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              width: size.width * 0.44,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                color: Colors.transparent,
              ),
              child: Center(child: Text(secondTab)),
            ),
          ],
        ),
      ),
    );
  }
}
