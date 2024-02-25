import 'package:flutter/material.dart';

List<Color> colors = const [
  Color(0xFFFFFFFF),
  Color(0xffF28B83),
  Color(0xFFFCBC05),
  Color(0xFFFFF476),
  Color(0xFFCBFF90),
  Color(0xFFA7FEEA),
  Color(0xFFE6C9A9),
  Color(0xFFE8EAEE),
  Color(0xFFA7FEEA),
  Color(0xFFCAF0F8)
];

class ColorPicker extends StatefulWidget {
  int index;
  final Function(int) onTap;
  ColorPicker({Key? key, required this.index, required this.onTap})
      : super(key: key);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              widget.index = index;
              widget.onTap(index);
              setState(() {});
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 2),
                      color: colors[index]),
                ),
                widget.index == index ? const Icon(Icons.check) : Container()
              ],
            ),
          );
        },
      ),
    );
  }
}









































// import 'package:flutter/material.dart';


// class ColorPicker extends StatefulWidget {
//   ColorPicker({required this.index, required this.onTap, super.key});
//   int index;
//   Function(int) onTap;
//   @override
//   State<ColorPicker> createState() => _ColorPickerState();
// }

// class _ColorPickerState extends State<ColorPicker> {
//   List<Color> colors = const [
//     Color(0xFFFFFFFF),
//     Color(0xffF28B83),
//     Color(0xFFFCBC05),
//     Color(0xFFFFF476),
//     Color(0xFFCBFF90),
//     Color(0xFFA7FEEA),
//     Color(0xFFE6C9A9),
//     Color(0xFFE8EAEE),
//     Color(0xFFA7FEEA),
//     Color(0xFFCAF0F8)
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: colors.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               widget.index = index;
//               widget.onTap(index);
//               setState(() {});
//             },
//             child: CircleAvatar(
//               backgroundColor: colors[index],
//               radius: 32,
//               child: widget.index == index
//                   ? const Icon(Icons.check)
//                   : const SizedBox(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
