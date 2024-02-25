import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_style.dart';
import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/material.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key, required this.ticket, this.isColor});
  final Map<String, dynamic> ticket;
  final bool? isColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppLayout.getSize(context).width * 0.85,
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // for blue part of the ticket,
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? const Color(0xff526799) : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: isColor == null
                            ? Style.headlineStyle3.copyWith(color: Colors.white)
                            : Style.headlineStyle3.copyWith(
                                color: Colors.black,
                              ),
                      ),
                      const Spacer(),
                      const ThickContainer(
                        isColor: true,
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      (constraints.constrainWidth() / 6)
                                          .floor(),
                                      (index) => SizedBox(
                                        height: 1,
                                        width: 3,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                              color: isColor == null
                                                  ? Colors.white
                                                  : Colors.grey.shade300),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.5,
                                child: Icon(Icons.local_airport_rounded,
                                    color: isColor == null
                                        ? Colors.white
                                        : const Color(0xff8accf7)),
                              ),
                            )
                          ],
                        ),
                      ),
                      const ThickContainer(
                        isColor: true,
                      ),
                      const Spacer(),
                      Text(
                        ticket['to']['code'],
                        style: isColor == null
                            ? Style.headlineStyle3.copyWith(color: Colors.white)
                            : Style.headlineStyle3
                                .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          ticket['from']['name'],
                          style: isColor == null
                              ? Style.headlineStyle3
                                  .copyWith(color: Colors.white)
                              : Style.headlineStyle4,
                        ),
                      ),
                      Text(
                        ticket['flying_time'],
                        style: isColor == null
                            ? Style.headlineStyle3.copyWith(color: Colors.white)
                            : Style.headlineStyle3
                                .copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          ticket['to']['name'],
                          textAlign: TextAlign.end,
                          style: isColor == null
                              ? Style.headlineStyle3
                                  .copyWith(color: Colors.white)
                              : Style.headlineStyle4,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // for the red or orange part of the ticket,
            Container(
              color: isColor == null ? Style.orangeColor : Colors.white,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isColor == null ? Style.bgColor : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Flex(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            direction: Axis.horizontal,
                            children: List.generate(
                              (constraints.constrainWidth() / 15).floor(),
                              (index) => SizedBox(
                                height: 1,
                                width: 5,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: isColor == null
                                          ? Colors.white
                                          : Colors.grey.shade300),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 10,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: isColor == null ? Style.bgColor : Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 16, top: 10, right: 16, bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                  bottomRight: Radius.circular(isColor == null ? 21 : 0),
                ),
                color: isColor == null ? Style.orangeColor : Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ticket['date'],
                            style: isColor == null
                                ? Style.headlineStyle3
                                    .copyWith(color: Colors.white)
                                : Style.headlineStyle3,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'DATE',
                            style: isColor == null
                                ? Style.headlineStyle4
                                    .copyWith(color: Colors.white)
                                : Style.headlineStyle4,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ticket['departure_time'],
                            style: isColor == null
                                ? Style.headlineStyle3
                                    .copyWith(color: Colors.white)
                                : Style.headlineStyle3,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Departure time',
                            style: isColor == null
                                ? Style.headlineStyle4
                                    .copyWith(color: Colors.white)
                                : Style.headlineStyle4,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            ticket['number'].toString(),
                            style: isColor == null
                                ? Style.headlineStyle3
                                    .copyWith(color: Colors.white)
                                : Style.headlineStyle3,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Number',
                            style: isColor == null
                                ? Style.headlineStyle4
                                    .copyWith(color: Colors.white)
                                : Style.headlineStyle4,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
