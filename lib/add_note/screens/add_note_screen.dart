import 'package:flutter/material.dart';
import 'package:note_app/add_note/widgets/add_note_body.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NoteBody(),
    );
  }
}
