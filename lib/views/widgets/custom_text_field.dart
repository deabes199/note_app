// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:note_app/views/widgets/constant.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.hinttext,
     this.maxLins=1,
    this.onSaved, this.onChanged,
  });
  final String hinttext;
  final int maxLins;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          onChanged:onChanged ,
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
              focusedBorder: builBorder(kPrimaryColor)),
        ));
  }
}

OutlineInputBorder builBorder([color]) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white));
}
