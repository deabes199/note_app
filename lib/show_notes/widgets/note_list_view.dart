import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/show_notes/logic/show_note_cubit.dart';
import 'package:note_app/add_note/models/note_model.dart';
import 'package:note_app/show_notes/widgets/note_item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowNoteCubit, ShowNoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<ShowNoteCubit>(context).notes!;
        return Expanded(
          child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: NoteItem(
                    note: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
