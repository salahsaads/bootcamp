import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textfeild extends StatelessWidget {
  const textfeild({
    super.key,
    required this.iconname,
    required this.hint,
    required this.title,
    required this.passwordl,
  
    required this.textEditingController
  });
  final Icon? iconname;
  final String? hint;
  final String? title;
  final bool? passwordl;
  final TextEditingController textEditingController;

  Widget build(BuildContext context) {
    return Column(
      children: [
        //text feild title

        Row(
          children: [
            Text(
              '${title}',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.text,
                  fontFamily: 'Manrope'),
            ),
          ],
        ),
        //text feid
        size.height(7),
        Container(
          width: 300.w,
          height: 50.h,
          // ignore: sort_child_properties_last
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextField(
              controller: textEditingController,
              obscureText: passwordl!,
              decoration: InputDecoration(
                  suffixIcon: passwordl! ? Icon(Icons.visibility_off) : null,
                  prefixIcon: iconname,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: colors.sub_backround, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: colors.sub_backround, width: 1)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: colors.sub_backround, width: 1)),
                  hintText: '${hint}',
                  helperStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: colors.sub_backround,
                      fontFamily: 'Manrope')),
            ),
          ),
          decoration: BoxDecoration(
              color: colors.sub_backround,
              borderRadius: BorderRadius.circular(10)),
        )
      ],
    );
  }
}
