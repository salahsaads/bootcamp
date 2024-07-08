import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.ba_color,
        body: Column(children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assats/85215.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                left: MediaQuery.of(context).size.width * 0.35,
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundImage: AssetImage('assats/10.png'),
                ),
              ),
            ],
          ),
          // user name
          Text(
            'User Name',
            style: TextStyle(
                fontSize: 20.sp,
                color: colors.text,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold),
          ),
          //user email
          size.height(20),
          Row(
            children: [
              size.width(MediaQuery.of(context).size.width * 0.2),

              // email icon
              Icon(
                Icons.email_outlined,
                size: 20.sp,
                color: colors.text,
              ),
              size.width(10.w),
              Text(
                'saad5@gmail.com',
                style: TextStyle(
                    fontSize: 15.sp,
                    color: colors.text,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          //user phone number
          size.height(20),

          Row(
            children: [
              size.width(MediaQuery.of(context).size.width * 0.2),

              // phone icon
              Icon(
                Icons.call_outlined,
                size: 20.sp,
                color: colors.text,
              ),
              size.width(10.w),
              Text(
                '021113750975',
                style: TextStyle(
                    fontSize: 15.sp,
                    color: colors.text,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // delete and block buttons
          size.height(40),
          Row(
            children: [
              size.width(MediaQuery.of(context).size.width * 0.1),
              // delete button
              GestureDetector(
                onTap: () {},
                child: Container(
                    width: 120.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: colors.background,
                      border: Border.all(
                        color: colors.primary,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text("Delete",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: colors.primary,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.bold)),
                    )),
              ),
              size.width(20.w),
              // block button
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 120.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    border: Border.all(
                      color: colors.primary,
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                      child: Text(
                    "Block",
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: colors.background,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
        ]));
  }
}
