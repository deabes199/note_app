import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note/logic/add_note_cubit.dart';
import 'package:note_app/add_note/models/note_model.dart';
import 'package:note_app/add_note/screens/add_note_screen.dart';
import 'package:note_app/core/routing/routes.dart';
import 'package:note_app/edit_note/screens/edit_note_screen.dart';
import 'package:note_app/show_notes/logic/show_note_cubit.dart';
import 'package:note_app/show_notes/screen/show_notes_screen.dart';

class AppRouter {
  Route? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.addNote:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddNoteCubit(),
                  child: const AddNoteScreen(),
                ));
      case Routes.editNote:
        final arg = settings.arguments as NoteModel;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ShowNoteCubit()..fitchAllNotes(),
                  child: EditNoteScreen(note: arg),
                ));

      case Routes.showNote:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => ShowNoteCubit()..fitchAllNotes(),
                  child: const ShowNotesScreen(),
                ));
      default:
        const Scaffold(
          body: Center(
            child: Text('not routes'),
          ),
        );
    }
    return null;
  }
}
