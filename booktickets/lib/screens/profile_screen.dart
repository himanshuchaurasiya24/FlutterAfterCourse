import 'package:booktickets/utils/app_style.dart';
import 'package:booktickets/widgets/colum_text_layout.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/img_1.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Book Tickets',
                          style: Style.headlineStyle1,
                        ),
                        Text(
                          'New York',
                          style: Style.headlineStyle4,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xfffef4f3),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff526799),
                                ),
                                child: const Icon(
                                  FluentSystemIcons.ic_fluent_shield_filled,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Premium status',
                                style: Style.textStyle.copyWith(
                                    color: Style.primaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  'edit',
                  style: Style.headlineStyle4.copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.only(left: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Style.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -35,
                    top: -40,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 18,
                            color: const Color.fromARGB(255, 3, 68, 121),
                          ),
                          color: Colors.transparent),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Style.bgColor,
                        ),
                        child: const Icon(
                          FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                          size: 35,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'You\'ve got a new award',
                            style: Style.headlineStyle3
                                .copyWith(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            'You have 150 flights in a year',
                            style: Style.headlineStyle4
                                .copyWith(color: Colors.white, fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Accumulated Miles',
              style: Style.headlineStyle1,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                '192803',
                style: Style.headlineStyle2.copyWith(
                  fontSize: 40,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Miles accured',
                  style: Style.headlineStyle4.copyWith(fontSize: 20),
                ),
                Text(
                  '09 Dec 2023',
                  style: Style.headlineStyle4.copyWith(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ColumnTextLayout(
                  firstText: '23 042',
                  secondText: 'Miles',
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                ColumnTextLayout(
                  firstText: 'Airline CO',
                  secondText: 'Received from',
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ColumnTextLayout(
                  firstText: '24',
                  secondText: 'Miles',
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                ColumnTextLayout(
                  firstText: 'McDonal\'s',
                  secondText: 'Received from',
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ColumnTextLayout(
                  firstText: '52 340',
                  secondText: 'Miles',
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                ColumnTextLayout(
                  firstText: 'Exuma',
                  secondText: 'Received from',
                  crossAxisAlignment: CrossAxisAlignment.end,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'How to get more miles',
                style: Style.headlineStyle4.copyWith(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
