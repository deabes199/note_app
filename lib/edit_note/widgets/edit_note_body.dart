import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/routing/routes.dart';
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
  TextEditingController editTitleController = TextEditingController();
  TextEditingController editContentController = TextEditingController();
  String? title, subTitle;
  @override
  void dispose() {
    super.dispose();
    editContentController.dispose();
    editTitleController.dispose();
  }

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
                Navigator.of(context).pushNamed(Routes.showNote);
              },
              title: 'Edit Notes',
              icon: Icons.check),
          const SizedBox(
            height: 50,
          ),
          CustomTextFeild(
              textEditingController: editTitleController,
              onChanged: (value) {
                title = value;
              },
              hinttext: widget.note.title),
          const SizedBox(
            height: 16,
          ),
          CustomTextFeild(
            textEditingController: editContentController,
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
