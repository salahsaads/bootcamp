import 'package:bootcamp/Features/Auth/Ui/screen/singin.dart';
import 'package:bootcamp/Features/Auth/data/network.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:icons_plus/icons_plus.dart';
import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          size.height(50),
          // user name and person icon and user email
          Row(
            children: [
              size.width(15),
              CircleAvatar(
                backgroundColor: colors.primary,
                radius: 30.r,
                child: Icon(
                  Icons.person_outline,
                  size: 30.sp,
                  color: colors.background,
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text('User Name',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: colors.subtext,
                              fontFamily: 'Lexend')),
                    ],
                  ),
                  size.height(5),
                  Row(
                    children: [
                      size.width(30),
                      Text('hssjdajal@gmail.com',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: colors.subtext,
                              fontFamily: 'Lexend')),
                    ],
                  ),
                ],
              )
            ],
          ),

          size.height(50),
          // sign out
          InkWell(
            onTap: () async {
              String x = await authNeteork().logout();
              context.navigateTo(Singin());
            },
            child: Container(
              height: 50.h,
              width: 300.w,
              decoration: BoxDecoration(
                color: colors.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: colors.background,
                      fontFamily: 'Lexend'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
