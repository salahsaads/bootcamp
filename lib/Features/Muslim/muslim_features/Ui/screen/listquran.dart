import 'package:bootcamp/Features/Muslim/muslim_features/Cubit/cubit/muslim_cubit.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/Ui/screen/play_Sura.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/Ui/screen/surah.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/Color.dart';

class quranlist extends StatefulWidget {
  const quranlist({super.key});

  @override
  State<quranlist> createState() => _quranlistState();
}

class _quranlistState extends State<quranlist> {
  String convertNumberToArabic(String englishNumber) {
    if (englishNumber == null || englishNumber.isEmpty) {
      return '';
    }

    Map<String, String> numberMap = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    String arabicNumber = '';
    for (int i = 0; i < englishNumber.length; i++) {
      arabicNumber += numberMap[englishNumber[i]] ?? englishNumber[i];
    }

    return arabicNumber;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MuslimCubit()..getQuranList(),
      child: BlocConsumer<MuslimCubit, MusilmState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<MuslimCubit>(context);
          return Scaffold(
            backgroundColor: colors.ba_color,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  size.height(40),
                  //container for last read
                  Row(
                    children: [
                      size.width(20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: 320.w,
                        height: 180.h,
                        decoration: BoxDecoration(
                            color: colors.primary,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: colors.primary,
                                  blurRadius: 10,
                                  offset: Offset(0, 4))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                // texts
                                Column(
                                  children: [
                                    size.height(20),
                                    // last read
                                    Row(
                                      children: [
                                        Text('☪ Last Read',
                                            style: TextStyle(
                                                fontSize: 22.sp,
                                                color: colors.background,
                                                fontFamily: 'Lexend',
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                    size.height(25),
                                    // surah name
                                    Row(
                                      children: [
                                        Text(
                                          'Surah Al-Fatihah',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: colors.text,
                                              fontFamily: 'Lexend',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    size.height(30),
                                    // surah No
                                    Row(
                                      children: [
                                        Text('Surah NO.1',
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: colors.background,
                                                fontFamily: 'Lexend',
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                                size.width(5),

                                // quran image
                                Image(
                                  image: AssetImage('assats/Rectangle 4.png'),
                                  width: 130.w,
                                  height: 150.h,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  size.height(20),

                  state == QuranListLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: colors.primary,
                          ),
                        )
                      : Container(
                          height: MediaQuery.sizeOf(context).height - 250.h,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.quranlist.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, left: 20, bottom: 10.0),
                                  child: Container(
                                    height: 90.h,
                                    decoration: BoxDecoration(
                                        color: colors.background,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: colors.primary,
                                              blurRadius: 5,
                                              offset: Offset(0, 1))
                                        ]),
                                    child: Row(
                                      children: [
                                        size.width(10),
                                        // surah number
                                        Text(
                                          '\u06DD' +
                                              convertNumberToArabic(
                                                      (index + 1).toString())
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 32.sp,
                                              color: colors.primary,
                                              fontFamily: 'Lexend'),
                                        ),
                                        size.width(10),
                                        // surah name in arabic and english
                                        Column(
                                          children: [
                                            size.height(10),
                                            Text(
                                                '${cubit.quranlist[index]['name']}',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: colors.text,
                                                    fontFamily: 'Lexend')),
                                            size.height(2),
                                            Text(
                                                '${cubit.quranlist[index]['englishName']}',
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: colors.text,
                                                    fontFamily: 'Lexend')),
                                          ],
                                        ),
                                        Spacer(),

                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Column(
                                            children: [
                                              size.height(10),
                                              // Two buttons for play and read in row
                                              Row(
                                                children: [
                                                  // play button
                                                  GestureDetector(
                                                    onTap: () {
                                                      context
                                                          .navigateTo(playSuarh(
                                                        id: cubit.quranlist[
                                                            index]['number'],
                                                        name: cubit.quranlist[
                                                            index]['name'],
                                                        englishname:
                                                            cubit.quranlist[
                                                                    index]
                                                                ['englishName'],
                                                      ));
                                                    },
                                                    child: Container(
                                                      width: 55.w,
                                                      height: 35.h,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                colors.primary),
                                                        color:
                                                            colors.background,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Icon(
                                                        Icons.play_arrow,
                                                        color: colors.primary,
                                                      )),
                                                    ),
                                                  ),
                                                  size.width(20),
                                                  // read button
                                                  GestureDetector(
                                                    onTap: () {
                                                      context.navigateTo(surah(
                                                        id: cubit.quranlist[
                                                            index]['number'],
                                                        name: cubit.quranlist[
                                                            index]['name'],
                                                        englishname:
                                                            cubit.quranlist[
                                                                    index]
                                                                ['englishName'],
                                                      ));
                                                    },
                                                    child: Container(
                                                      width: 55.w,
                                                      height: 35.h,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                colors.primary),
                                                        color:
                                                            colors.background,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Center(
                                                          child: Icon(
                                                        Icons
                                                            .menu_book_outlined,
                                                        color: colors.primary,
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // type of the surah and its ayat count
                                              size.height(5),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${cubit.quranlist[index]['revelationType']}',
                                                    style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color:
                                                                colors.subtext,
                                                            fontFamily:
                                                                'Lexend')
                                                        .copyWith(
                                                      fontSize: 14.sp,
                                                      color: colors.text,
                                                    ),
                                                  ),
                                                  size.width(20),
                                                  Text(
                                                      'Ayahs: ' +
                                                          cubit.quranlist[index]
                                                                  [
                                                                  'numberOfAyahs']
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          color: colors.text,
                                                          fontFamily:
                                                              'Lexend')),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
