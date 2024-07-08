import 'package:bootcamp/core/theming/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/Size.dart';

class text_massage extends StatelessWidget {
  text_massage(
      {super.key,
      required this.username,
      required this.time,
      required this.message,
      required this.seen,
      required this.isSender});

  String? username;
  String? time;
  String? message;
  bool? seen;
  bool? isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.5,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        color: isSender == true ? colors.background : colors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft:
              isSender == true ? Radius.circular(20) : Radius.circular(0),
          bottomRight:
              isSender == true ? Radius.circular(0) : Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          size.height(2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // username
              Text(username!,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: colors.text,
                      fontFamily: 'Lexend')),
              size.width(10.w),
              // time
              Text(time!,
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: colors.text,
                      fontFamily: 'Lexend')),
              // seen icon
              Icon(
                seen == true ? Icons.done_all : Icons.done,
                size: 15.sp,
                color: colors.text,
              ),
            ],
          ),
          size.height(5.h),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.5,
            height: message!.length < 20 ? 40.h : message!.length * 1.5.h,
            child: Text(
              message!,
              style: TextStyle(
                  fontSize: 15.sp, color: colors.text, fontFamily: 'Lexend'),
            ),
          ),
        ],
      ),
    );
  }
}
