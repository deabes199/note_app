import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widgets/color_list_view.dart';
import 'package:note_app/views/widgets/custom_button.dart';
import 'package:note_app/views/widgets/custom_text_field.dart';
import 'package:note_app/views/widgets/format_date.dart';

class NoteFromField extends StatefulWidget {
  const NoteFromField({
    super.key,
  });

  @override
  State<NoteFromField> createState() => _NoteFromFieldState();
}

class _NoteFromFieldState extends State<NoteFromField> {
  GlobalKey<FormState> globalKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          CustomTextFeild(
            onSaved: (value) {
              title = value;
            },
            hinttext: 'Title',
          ),
          SizedBox(
            height: 24,
          ),
          CustomTextFeild(
            onSaved: (value) {
              subTitle = value;
            },
            hinttext: 'content',
            maxLins: 5,
          ),
            SizedBox(
            height: 32,
          ),
          ColorListView(),
          SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
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
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}


