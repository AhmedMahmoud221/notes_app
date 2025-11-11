
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});

  final bool isActive;

  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
      ? CircleAvatar(
        radius: 38 ,
        backgroundColor: Colors.white,
        child: CircleAvatar(
        radius: 36.5,
        backgroundColor: color,
        ),
      )  
    : CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}


class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key,});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int currentIndex = 0;

  List<Color> Colors = [
    Color(0xffAC3931),
    Color(0xffE5D352),
    Color(0xffD9E76C),
    Color(0xff537D8D),
    Color(0xff482C3D),
  ] ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35* 3,
      child: ListView.builder(
        itemCount: Colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: ()
              {
                currentIndex = index;
                setState(() {});
              },
              child: ColorItem(
                color: Colors[index],
                isActive: currentIndex == index ,
              ),
            ),
          );
        },
      ),
    );
  }
}
