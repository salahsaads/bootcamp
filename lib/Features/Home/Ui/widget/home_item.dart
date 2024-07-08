// ignore_for_file: sort_child_properties_last

import 'package:bootcamp/Features/Home/data/model.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home_Item_widget extends StatelessWidget {
  const Home_Item_widget(
      {super.key, required this.Home_Model_list, required this.index});

  final List<Home_Model> Home_Model_list;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Container(
          child: Column(
            children: [
              size.height(4.h),
              Image.asset(
                Home_Model_list[index].Image!,
                height: 50.h,
              ),
              Text(
                Home_Model_list[index].name!,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: colors.primary,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: colors.background,
              border: Border.all(color: colors.primary),
              borderRadius: BorderRadius.circular(10.r)),
          width: 100.w,
          height: 60.h,
        ));
  }
}
