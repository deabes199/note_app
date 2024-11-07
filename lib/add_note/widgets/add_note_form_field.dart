import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/add_note/logic/add_note_cubit.dart';
import 'package:note_app/add_note/models/note_model.dart';
import 'package:note_app/core/routing/routes.dart';
import 'package:note_app/core/widgets/custom_button.dart';
import 'package:note_app/core/widgets/custom_text_field.dart';
import 'package:note_app/core/widgets/format_date.dart';

class AddNoteFromField extends StatefulWidget {
  const AddNoteFromField({
    super.key,
  });

  @override
  State<AddNoteFromField> createState() => _AddNoteFromFieldState();
}

class _AddNoteFromFieldState extends State<AddNoteFromField> {
  GlobalKey<FormState> globalKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextFeild(
            textEditingController: titleController,
            onSaved: (value) {
              title = value;
            },
            hinttext: 'Title',
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextFeild(
            textEditingController: contentController,
            onSaved: (value) {
              subTitle = value;
            },
            hinttext: 'content',
            maxLins: 6,
          ),
          const SizedBox(
            height: 100,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                color: Colors.blue,
                title: 'Add',
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  String formattedCurrentDate = dateFormat();
                  if (globalKey.currentState!.validate()) {
                    globalKey.currentState!.save();
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentDate,
                        color: Colors.blue.value);
                    context.read<AddNoteCubit>().addNote(noteModel);
                    titleController.clear();
                    contentController.clear();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 22,
          ),
          CustomButton(
            color: Colors.red,
            title: 'My Notes',
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Routes.showNote);
            },
          )
        ],
      ),
    );
  }
}
