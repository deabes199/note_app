import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/routing/routes.dart';
import 'package:note_app/show_notes/logic/show_note_cubit.dart';
import 'package:note_app/add_note/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(Routes.editNote, arguments: note);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 16),
                  child: Text(
                    note.subTitle,
                    style: const TextStyle(color: Colors.black, fontSize: 26),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    context.read<ShowNoteCubit>().fitchAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 26,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  note.date,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
