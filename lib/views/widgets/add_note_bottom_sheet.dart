import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note/add_note_cubit.dart';
import 'package:note_app/cubits/note/cubit/note_cubit.dart';

import 'package:note_app/views/widgets/note_form_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteSuccess) {
            BlocProvider.of<NoteCubit>(context).fitchAllNotes();
            Navigator.of(context).pop();
          } else {
            if (state is AddNoteFaliure) {
              state.errMessage.toString();
            }
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(child: NoteFromField()),
              ));
        },
      ),
    );
  }
}
