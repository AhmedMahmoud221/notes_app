import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constansts.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_search_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {

  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 50,),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(height: 50,),
          CustomTextField(
            onChange: (value) {
              title = value;
            },
            hint: widget.note.title,
            ),
          const SizedBox(height: 20,),
          CustomTextField(
            onChange: (value) {
              content = value;
            },
            hint: widget.note.subTitle,
            maxLines: 5,
            ),
          EditNotsColorsList (note: widget.note,),
        ],
      ),
    );
  }
}





class EditNotsColorsList extends StatefulWidget {
  const EditNotsColorsList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotsColorsList> createState() => _EditNotsColorsListState();
}

class _EditNotsColorsListState extends State<EditNotsColorsList> {

  int currentIndex = 0;

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