import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_style.dart';
import 'package:flutter/material.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key, required this.hotel});
  final Map<String, dynamic> hotel;

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      height: 350,
      margin: const EdgeInsets.only(right: 16),
      width: size.width * 0.60,
      decoration: BoxDecoration(
        color: Style.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Style.primaryColor,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/${hotel['image']}'))),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            hotel['place'],
            style: Style.headlineStyle1.copyWith(
              color: Colors.grey,
            ),
          ),
          Text(
            hotel['destination'],
            style: Style.headlineStyle4.copyWith(color: Colors.white),
          ),
          Text(
            '\$${hotel['price']}/night',
            style: Style.headlineStyle1.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
