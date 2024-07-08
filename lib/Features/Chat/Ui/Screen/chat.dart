import 'package:bootcamp/Features/Chat/Ui/Screen/profile.dart';
import 'package:bootcamp/Features/Chat/Ui/Widget/image_massage.dart';
import 'package:bootcamp/Features/Chat/Ui/Widget/massages_sender.dart';
import 'package:bootcamp/Features/Chat/Ui/Widget/text_massage.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.ba_color,
      floatingActionButton: massages_sender(),
      body: Column(children: [
        size.height(30.h),
        // user name , user image , pop icon , last seen , video call icon and voice call icon
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        context.goBack();
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: 20.sp, color: colors.text)),
                  size.width(10.w),
                  GestureDetector(
                    onTap: () {
                      context.navigateTo(profile());
                    },
                    child: CircleAvatar(
                      radius: 23.r,
                      backgroundImage: AssetImage('assats/10.png'),
                      backgroundColor: colors.primary,
                    ),
                  ),
                  size.width(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.navigateTo(profile());
                        },
                        child: Text(
                          'User Name',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color: colors.text,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'last seen recently',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: colors.subtext,
                            fontFamily: 'Lexend'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w, top: 20.h),
              child: Row(
                children: [
                  Icon(
                    Icons.call_outlined,
                    size: 27.sp,
                    color: colors.primary,
                  ),
                  size.width(20.w),
                  Icon(
                    Icons.videocam_outlined,
                    size: 30.sp,
                    color: colors.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
            child: Container(
          color: colors.ba_color,
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  size.height(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      image_massage(
                          username: "Salah Saad",
                          time: "12:00",
                          messageUrl: "assats/10.png",
                          seen: false,
                          isSender: true,
                          isvideo: false)
                    ],
                  ),
                  size.height(10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      text_massage(
                        username: "Salah sss",
                        time: "12:00",
                        message: "Hellohfsuidfkjdhckjdchv",
                        seen: false,
                        isSender: false,
                      )
                    ],
                  ),
                ],
              );
            },
          ),
        )),
      ]),
    );
  }
}
