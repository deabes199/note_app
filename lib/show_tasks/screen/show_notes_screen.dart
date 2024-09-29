import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/custom_app_bar.dart';
import 'package:note_app/show_tasks/widgets/note_list_view.dart';

class ShowNotesScreen extends StatelessWidget {
  const ShowNotesScreen({super.key});

  @override
 

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              CustomAppBar(title: 'Show Notes', icon: Icons.notes_outlined),
              NoteListView(),
            ],
          ),
        ),
      ),
    );
  }
}
