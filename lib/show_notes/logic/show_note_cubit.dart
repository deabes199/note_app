import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/add_note/models/note_model.dart';
import 'package:note_app/core/widgets/constant.dart';

part 'show_note_state.dart';

class ShowNoteCubit extends Cubit<ShowNoteState> {
  ShowNoteCubit() : super(NoteInitial());
  List<NoteModel>? notes;

  fitchAllNotes() async {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notes = noteBox.values.toList();
    emit(NoteSuccess());
  }
}
