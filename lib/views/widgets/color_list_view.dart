import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note/add_note_cubit.dart';

class ClolorItem extends StatelessWidget {
  const ClolorItem({super.key, required this.isActive, required this.colors});
  final bool isActive;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 36,
              backgroundColor: colors,
            ),
          )
        : CircleAvatar(
            radius: 38,
            backgroundColor: colors,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colors = [
    Color(0xffFE6F5E),
    Color(0xffFFD700),
    Color(0xff3D0C02),
    Color(0xffC3B091),
    Color(0xff50C878),
    Color(0xff7FFFD4),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                context.read<AddNoteCubit>().color = colors[index];
                setState(() {});
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: ClolorItem(
                  colors: colors[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
