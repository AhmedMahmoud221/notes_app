import 'package:flutter/material.dart';
import 'package:notes_app/constansts.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';

class EditNotsColorsList extends StatefulWidget {
  const EditNotsColorsList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotsColorsList> createState() => _EditNotsColorsListState();
}

class _EditNotsColorsListState extends State<EditNotsColorsList> {

  late int currentIndex;

  @override
  void initState(){
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35* 3,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: GestureDetector(
              onTap: ()
              {
                currentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index ,
              ),
            ),
          );
        },
      ),
    );
  }
}