import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/Color.dart';
import '../../../../core/theming/Size.dart';

class massages_sender extends StatefulWidget {
  const massages_sender({super.key});

  @override
  State<massages_sender> createState() => _massages_senderState();
}

class _massages_senderState extends State<massages_sender> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 40.w, right: 13.w),
        width: MediaQuery.sizeOf(context).width,
        height: 60.h,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 7.w),
          child: Row(
            children: [
              Icon(Icons.add_circle_outline, size: 25.sp, color: colors.text),
              size.width(7.w),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.55,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type a message',
                    hintStyle: TextStyle(
                        fontSize: 15.sp,
                        color: colors.subtext,
                        fontFamily: 'Lexend'),
                    border: InputBorder.none,
                  ),
                ),
              ),
              size.width(7.w),
              // voice icon
              Icon(Icons.mic, size: 20.sp, color: colors.text),
              size.width(5.w),
              // send icon
              Icon(Icons.send, size: 20.sp, color: colors.text),
            ],
          ),
        ));
  }
}
