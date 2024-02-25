import 'package:barcode_widget/barcode_widget.dart';
import 'package:booktickets/screens/ticket_view.dart';
import 'package:booktickets/utils/app_info_list.dart';
import 'package:booktickets/utils/app_style.dart';
import 'package:booktickets/widgets/app_ticket_tab.dart';
import 'package:booktickets/widgets/colum_text_layout.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'Tickets',
                style: Style.headlineStyle1,
              ),
              const SizedBox(
                height: 20,
              ),
              const AppTicketTab(firstTab: 'Upcoming', secondTab: 'Previous'),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: TicketView(
                  ticket: ticketList[0],
                  isColor: true,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                // color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21)),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnTextLayout(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          firstText: 'Flutter DB',
                          secondText: 'Passenger',
                        ),
                        ColumnTextLayout(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          firstText: '5221894759723',
                          secondText: 'Passport',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ColumnTextLayout(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          firstText: '0055 444 77147',
                          secondText: 'Number of E-Ticket',
                        ),
                        ColumnTextLayout(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          firstText: 'B2SG28',
                          secondText: 'Booking Code',
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/visa.png',
                                  scale: 11,
                                ),
                                Text(
                                  '*** 2462',
                                  style: Style.headlineStyle3,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Payment Method',
                              style: Style.headlineStyle4,
                            )
                          ],
                        ),
                        const ColumnTextLayout(
                          firstText: '\$249.99',
                          secondText: 'Price',
                          crossAxisAlignment: CrossAxisAlignment.end,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      data: 'https://github.com/martinovo',
                      barcode: Barcode.code128(),
                      style: Style.textStyle,
                      width: double.infinity,
                      height: 70,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: TicketView(
                  ticket: ticketList[0],
                ),
              )
            ],
          ),
          Positioned(
            left: 19,
            top: 295,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Style.textColor,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Style.textColor,
              ),
            ),
          ),
          Positioned(
            right: 19,
            top: 295,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Style.textColor,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Style.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
