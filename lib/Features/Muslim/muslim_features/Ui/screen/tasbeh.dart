import 'package:bootcamp/Features/Muslim/muslim_features/data/tasbeh_model.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/Size.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.ba_color,
        //AppBer
        appBar: AppBar(
          backgroundColor: colors.ba_color,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              (context).goBack();
            },
          ),
          title: Text(
            'Tasbeh',
            style: TextStyle(
                fontSize: 25.sp,
                color: colors.text,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            size.height(10),
            Container(
                height: 200.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tasabehList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            size.height(20),
                            Text(
                                textAlign: TextAlign.center,
                                '${tasabehList[index].content}',
                                style: TextStyle(
                                    fontSize: textstyle().fontsize(
                                        tasabehList[index].content.length, 15),
                                    color: colors.text,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.bold)),
                            size.height(10),
                            Text(
                                textAlign: TextAlign.center,
                                '${tasabehList[index].description}',
                                style: TextStyle(
                                    fontSize: textstyle().subfontsize(
                                        tasabehList[index].description.length),
                                    color: colors.background,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        height: 40.h,
                        width: 270.w,
                        margin: EdgeInsets.only(left: 10.w, right: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: colors.primary),
                      );
                    })),
            size.height(100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      count = 0;
                    });
                  },
                  child: Container(
                    child: Icon(
                      Icons.restart_alt_outlined,
                      size: 40,
                      color: colors.background,
                    ),
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: colors.subtext,
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Container(
                    child: Icon(
                      Icons.add,
                      size: 50,
                      color: colors.background,
                    ),
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                )
              ],
            ),
            CircleAvatar(
              radius: 50.r,
              backgroundColor: colors.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${count}',
                    style: TextStyle(
                        fontSize: 25.sp,
                        color: colors.text,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold),
                  ),
                  size.height(0),
                  Text(
                    'Tasbeha',
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: colors.text,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
