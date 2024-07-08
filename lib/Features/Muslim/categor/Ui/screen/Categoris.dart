import 'package:bootcamp/Features/Home/data/model.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/Ui/screen/Azker.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/Ui/screen/duaa.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/Ui/screen/tasbeh.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/data/duaa_model.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categoris extends StatefulWidget {
  const Categoris({super.key});

  @override
  State<Categoris> createState() => _CategorisState();
}

class _CategorisState extends State<Categoris> {
  List<Home_Model> Home_Model_list = [
    Home_Model(name: 'Quran', Image: 'assats/Rectangle 4.png'),
    Home_Model(name: 'Hadith', Image: 'assats/Rectangle 5.png'),
    Home_Model(name: 'Tasbeh', Image: 'assats/Rectangle 6.png'),
    Home_Model(name: 'Azkar ', Image: 'assats/Rectangle 7.png'),
    Home_Model(name: 'Duaa ', Image: 'assats/Rectangle 8.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.ba_color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            size.height(45),
            // user name and person icon
            Row(
              children: [
                size.width(30),
                Text('Hello,',
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: colors.text,
                        fontFamily: 'Lexend')),
                Text('Salah!',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: colors.text,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold)),
                Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.person_circle,
                      size: 30.sp,
                      color: colors.text,
                    )),
              ],
            ),
            size.height(15),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 400.h,
                child: GridView.builder(
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.5),
                    itemBuilder: (context, idex) {
                      return GestureDetector(
                        onTap: () {
                          if (idex == 0) {
                            //(context).navigateTo();
                          } else if (idex == 1) {
                          } else if (idex == 2) {
                            (context).navigateTo(Tasbeh());
                          } else if (idex == 3) {
                            (context).navigateTo(Azker());
                          } else if (idex == 4) {
                            (context).navigateTo(DuaaSceen());
                          }
                        },
                        child: Container(
                          child: Column(
                            children: [
                              size.height(4.h),
                              Image.asset(
                                Home_Model_list[idex].Image!,
                                height: 50.h,
                              ),
                              Text(
                                Home_Model_list[idex].name!,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: colors.background,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(10.r)),
                          width: 100.w,
                          height: 60.h,
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
