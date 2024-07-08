import 'package:bootcamp/Features/Chat/Ui/Screen/chats.dart';
import 'package:bootcamp/Features/Home/Ui/home.dart';
import 'package:bootcamp/Features/Muslim/categor/Ui/screen/Categoris.dart';
import 'package:bootcamp/Features/UserInfo/ui/screens/settings.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> screens = [
  const Home(),
  const chats(),
  Container(
    child: const Center(
      child: Text('Book'),
    ),
  ),
  Categoris(),
  const settings()
];

class navi extends StatefulWidget {
  const navi({super.key});

  @override
  State<navi> createState() => _naviState();
}

class _naviState extends State<navi> {
  var varscreen = screens[0];
  int selector = 0;
  void selectorfun(int index) {
    setState(() {
      selector = index;
      varscreen = screens[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: varscreen,
      floatingActionButton: Container(
          margin: EdgeInsets.only(left: 30),
          height: 60.h,
          decoration: BoxDecoration(
            color: colors.background,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.home_outlined),
                    onPressed: () {
                      setState(() {
                        varscreen = screens[0];
                        selectorfun(0);
                      });
                    },
                    color: selector == 0 ? colors.primary : colors.subtext,
                    iconSize: 30,
                  ),
                  size.height(1),
                  Container(
                    height: 2.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color:
                            selector == 0 ? colors.primary : colors.background,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
              size.width(13),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.chat_bubble_2),
                    onPressed: () {
                      setState(() {
                        varscreen = screens[1];
                        selectorfun(1);
                      });
                    },
                    color: selector == 1 ? colors.primary : colors.subtext,
                    iconSize: 30,
                  ),
                  size.height(1),
                  Container(
                    height: 2.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color:
                            selector == 1 ? colors.primary : colors.background,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
              size.width(13),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.video_call_outlined),
                    onPressed: () {
                      setState(() {
                        varscreen = screens[2];
                        selectorfun(2);
                      });
                    },
                    color: selector == 2 ? colors.primary : colors.subtext,
                    iconSize: 30,
                  ),
                  size.height(1),
                  Container(
                    height: 2.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color:
                            selector == 2 ? colors.primary : colors.background,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
              size.width(13),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu_book_rounded),
                    onPressed: () {
                      setState(() {
                        varscreen = screens[3];
                        selectorfun(3);
                      });
                    },
                    color: selector == 3 ? colors.primary : colors.subtext,
                    iconSize: 30,
                  ),
                  size.height(1),
                  Container(
                    height: 2.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color:
                            selector == 3 ? colors.primary : colors.background,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
              size.width(13),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.person_alt_circle_fill),
                    onPressed: () {
                      setState(() {
                        varscreen = screens[4];
                        selectorfun(4);
                      });
                    },
                    color: selector == 4 ? colors.primary : colors.subtext,
                    iconSize: 30,
                  ),
                  size.height(1),
                  Container(
                    height: 2.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color:
                            selector == 4 ? colors.primary : colors.background,
                        borderRadius: BorderRadius.circular(5)),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
