import 'package:bootcamp/Features/Chat/Ui/Widget/activeusers.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../cubit/cubit/chat_cubit.dart';
import 'chat.dart';

class chats extends StatefulWidget {
  const chats({super.key});

  @override
  State<chats> createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<ChatCubit>(context);
          return Scaffold(
            backgroundColor: colors.ba_color,
            body: SingleChildScrollView(
              child: Column(children: [
                size.height(30.h),
                // row include chats text and add icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 20.h),
                      child: Text(
                        'Chats',
                        style: TextStyle(
                            fontSize: 28.sp,
                            color: colors.text,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 20.w, top: 20.h),
                      child: GestureDetector(
                        onTap: () {
                          WoltModalSheet.show<void>(
                            // pageIndexNotifier: pageIndexNotifier,
                            context: context,
                            pageListBuilder: (modalSheetContext) {
                              return [
                                WoltModalSheetPage(
                                  backgroundColor: colors.background,
                                  child: Container(
                                    height: 400.h,
                                    child: Column(
                                      children: [
                                        size.height(20),
                                        Text('Start chat with Others',
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                color: colors.text,
                                                fontFamily: 'Lexend',
                                                fontWeight: FontWeight.bold)),
                                        size.height(20),
                                        Container(
                                            height: 320,
                                            child: StreamBuilder(
                                              stream: cubit.getallusers(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return ListView.builder(
                                                    itemCount: snapshot
                                                        .data!.docs.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ListTile(
                                                        leading: CircleAvatar(
                                                          radius: 22.sp,
                                                          backgroundImage:
                                                              AssetImage(
                                                                  'assats/10.png'),
                                                        ),
                                                        title: Text(
                                                          snapshot.data!
                                                                  .docs[index]
                                                              ['name'],
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color:
                                                                  colors.text,
                                                              fontFamily:
                                                                  'Lexend',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        subtitle: Text(
                                                          '${snapshot.data!.docs[index]['age']} years , ${snapshot.data!.docs[index]['city']} -${snapshot.data!.docs[index]['country'].toString().toUpperCase()}',
                                                          style: TextStyle(
                                                              fontSize: 13.sp,
                                                              color: colors
                                                                  .subtext,
                                                              fontFamily:
                                                                  'Lexend'),
                                                        ),
                                                        trailing: Icon(Icons
                                                            .add_circle_outline_sharp),
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }
                                              },
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ];
                            },
                          );
                        },
                        child: Icon(
                          Icons.add_circle_outline_sharp,
                          size: 30.sp,
                          color: colors.text,
                        ),
                      ),
                    ),
                  ],
                ),
                size.height(20.h),

                // listview for active users
                Container(
                  height: 95.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return activeUsers(
                        imagepath: "assats/10.png",
                      );
                    },
                  ),
                )
                // search bar
                ,
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: colors.background,
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: colors.sub_backround, width: 0)),
                    ),
                  ),
                ),
                size.height(10.h),
                // chats 1-1 or groups
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: Row(
                    children: [
                      //1-1
                      Column(
                        children: [
                          Icon(
                            Icons.chat_bubble_outline_sharp,
                            size: 20.sp,
                            color: colors.primary,
                          ),
                          size.height(5.h),
                          Text(
                            '1-1 Chats',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: colors.primary,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.bold),
                          ),
                          size.height(5.h),
                          Container(
                              width: MediaQuery.sizeOf(context).width * 0.47,
                              height: 2.5.h,
                              color: colors.primary)
                        ],
                      ),
                      // groups
                      Column(
                        children: [
                          Icon(
                            Icons.groups_2_outlined,
                            size: 20.sp,
                            color: colors.text,
                          ),
                          size.height(5.h),
                          Text(
                            'Groups',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: colors.text,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.bold),
                          ),
                          size.height(5.h),
                          Container(
                              width: MediaQuery.sizeOf(context).width * 0.47,
                              height: 2.5.h,
                              color: colors.ba_color)
                        ],
                      ),
                    ],
                  ),
                ),
                size.height(10.h),

                // chats
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: ListView.separated(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: GestureDetector(
                          onTap: () {
                            (context).navigateTo(chat());
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 22.sp,
                              backgroundImage: AssetImage('assats/10.png'),
                            ),
                            title: Text(
                              'Salah Saad',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: colors.text,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Hi, How Are you ?',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: colors.subtext,
                                  fontFamily: 'Lexend'),
                            ),
                            trailing: Text(
                              '12:30',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: colors.text,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 20.w, left: 20.w),
                        child: Divider(
                          color: colors.text,
                          thickness: 0.3.h,
                        ),
                      );
                    },
                  ),
                )
              ]),
            ),
          );
        },
      ),
    );
  }
}
