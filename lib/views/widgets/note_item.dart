import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note/cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return EditNoteView(note: note,);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.amber),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 16),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(.3), fontSize: 26),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    context.read<NoteCubit>().fitchAllNotes();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Color(note.color),
                    size: 26,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.4),
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
