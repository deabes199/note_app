import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/show_notes/logic/show_note_cubit.dart';
import 'package:note_app/add_note/models/note_model.dart';
import 'package:note_app/core/widgets/custom_app_bar.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                context.read<ShowNoteCubit>().fitchAllNotes();
                Navigator.of(context).pop();
              },
              title: 'Edit Notes',
              icon: Icons.check),
          const SizedBox(
            height: 50,
          ),
          CustomTextFeild(
              onChanged: (value) {
                title = value;
              },
              hinttext: widget.note.title),
          const SizedBox(
            height: 16,
          ),
          CustomTextFeild(
            onChanged: (value) {
              subTitle = value;
            },
            hinttext: widget.note.subTitle,
            maxLins: 5,
          )
        ],
      ),
    );
  }
}
