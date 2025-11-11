import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () 
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)
        {
          return EditNoteView(note: note,);
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child:  Text(
                  note.title,
                   style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  note.subTitle, 
                  style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 20,
                ),),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();

                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: Icon(
                  Icons.delete, 
                  color:  Colors.black.withOpacity(0.7),
                size: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date, 
                style: TextStyle(
                  fontSize: 16,
                  color:  Colors.black.withOpacity(0.5),
                  ),
                ),
            ), 
            ], 
          ),
        ),
      ),
    );
  }
}
