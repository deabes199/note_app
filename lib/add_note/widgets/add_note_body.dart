import 'package:flutter/material.dart';
import 'package:note_app/add_note/widgets/add_note_widgets.dart';
import 'package:note_app/core/widgets/custom_app_bar.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              title: 'Add Note',
              icon: Icons.add_outlined,
              onPressed: () {},
            ),
            const AddNotewidgets()
          ],
        ),
      ),
    );
  }
}
