import 'package:flutter/material.dart';
import 'package:note_app/show_notes/widgets/note_list_view.dart';

class ShowNotesScreen extends StatelessWidget {
  const ShowNotesScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
                    const Text('Show Notes',style: TextStyle(fontSize: 30),),
              ]),
              const NoteListView(),
            ],
          ),
        ),
      ),
    );
  }
}
