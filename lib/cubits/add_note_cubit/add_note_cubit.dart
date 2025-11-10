import 'package:bloc/bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
}