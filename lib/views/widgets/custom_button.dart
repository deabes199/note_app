import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap,  this.isLoading=false});
  final void Function()? onTap;
 final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
          child: Center(
              child:isLoading? CircularProgressIndicator() : Text(
            'Add',
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
