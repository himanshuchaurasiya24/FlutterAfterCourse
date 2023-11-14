import 'package:flutter/material.dart';

class PriorityPicker extends StatefulWidget {
  PriorityPicker({required this.index, required this.onTap, super.key});
  int index;
  Function(int) onTap;
  @override
  State<PriorityPicker> createState() => _PriorityPickerState();
}

class _PriorityPickerState extends State<PriorityPicker> {
  List<String> priorityList = ['Low', 'High', 'Very High'];
  List<Color> colorList = [Colors.green, Colors.amber, Colors.red];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: priorityList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              widget.index = index;
              widget.onTap(index);
              setState(() {});
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              decoration: BoxDecoration(
                color: widget.index == index ? colorList[index] : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: colorList[index]),
              ),
              width: MediaQuery.of(context).size.width / 3.15,
              child: Center(
                child: Text(priorityList[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
