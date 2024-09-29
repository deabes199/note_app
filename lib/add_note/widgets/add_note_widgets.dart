import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note/logic/add_note_cubit.dart';
import 'package:note_app/core/routing/routes.dart';

import 'package:note_app/add_note/widgets/add_note_form_field.dart';

class AddNotewidgets extends StatelessWidget {
  const AddNotewidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteSuccess) {
          Navigator.of(context).pushNamed(Routes.showNote);
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
              child: const SingleChildScrollView(child: AddNoteFromField()),
            ));
      },
    );
  }
}
