// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hinttext,
    this.maxLins = 1,
    this.onSaved,
    this.onChanged, required this.textEditingController,
  });
  final String hinttext;
  final int maxLins;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          controller: textEditingController,
          onChanged: onChanged,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Field is reqauird';
            } else {
              return null;
            }
          },
          onSaved: onSaved,
          maxLines: maxLins,
          decoration: InputDecoration(
              hintText: hinttext,
              border: builBorder(),
              enabledBorder: builBorder(),
              focusedBorder: builBorder(Colors.blue)),
        ));
  }
}

OutlineInputBorder builBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: Colors.grey));
}
