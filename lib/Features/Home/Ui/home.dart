// ignore_for_file: sort_child_properties_last

import 'package:bootcamp/Features/Home/Ui/widget/ItemCircler.dart';
import 'package:bootcamp/Features/Home/Ui/widget/home_item.dart';
import 'package:bootcamp/Features/Home/cubit/cubit/home_cubit.dart';
import 'package:bootcamp/Features/Home/data/model.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/data/duaa_model.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Home_Model> Home_Model_list = [
    Home_Model(name: 'Quran', Image: 'assats/Rectangle 4.png'),
    Home_Model(name: 'Hadith', Image: 'assats/Rectangle 5.png'),
    Home_Model(name: 'Tasbeh', Image: 'assats/Rectangle 6.png'),
    Home_Model(name: 'Azkar ', Image: 'assats/Rectangle 7.png'),
    Home_Model(name: 'Duaa ', Image: 'assats/Rectangle 8.png')
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getAdan("cairo", "egypt"),
        child: BlocConsumer<HomeCubit, HomeState>(
          builder: (context, State) {
            final cubit = BlocProvider.of<HomeCubit>(context);
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

                    State is AdanLoading
                        ? CircularProgressIndicator(
                            color: colors.primary,
                          )
                        :
                        // prays Time
                        Container(
                            child: Column(
                              children: [
                                size.height(140),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      cubit.Adan["Fajr"].toString(),
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    size.width(10),
                                    Text(
                                      cubit.Adan["Sunrise"].toString(),
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    size.width(20),
                                    Text(
                                      cubit.Adan["Dhuhr"].toString(),
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    size.width(10),
                                    Text(
                                      cubit.Adan["Asr"].toString(),
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    size.width(10),
                                    Text(
                                      cubit.Adan["Maghrib"].toString(),
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    size.width(15),
                                    Text(
                                      cubit.Adan["Isha"].toString(),
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: colors.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            width: MediaQuery.sizeOf(context).width,
                            height: 200.h,
                            decoration: const BoxDecoration(
                                color: colors.text,
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assats/Rectangle 9.png',
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                    size.height(10),
                    //List view
                    // Muslim Icons
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ItemCircler();
                          }),
                    ),
                    size.height(15),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          itemCount: muslim_features.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                (context).navigateTo(muslim_features[index]);
                              },
                              child: Home_Item_widget(
                                Home_Model_list: Home_Model_list,
                                index: index,
                              ),
                            );
                          }),
                    ),
                    size.height(15),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {},
        ));
  }
}
