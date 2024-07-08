import 'package:bootcamp/Features/Muslim/muslim_features/Cubit/cubit/muslim_cubit.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class surah extends StatefulWidget {
  surah(
      {super.key,
      required this.id,
      required this.name,
      required this.englishname});
  int? id;
  String? name;
  String? englishname;
  @override
  State<surah> createState() => _surahState();
}

class _surahState extends State<surah> {
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

  int sizefont = 18;
  bool showsettings = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MuslimCubit()..getSurah(widget.id!, 'ar'),
      child: BlocConsumer<MuslimCubit, MusilmState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<MuslimCubit>(context);
          if (state is SurahLoading) {
            return Scaffold(
              backgroundColor: colors.ba_color,
              body: Center(
                child: CircularProgressIndicator(
                  color: colors.primary,
                ),
              ),
            );
          } else {
            return Scaffold(
                backgroundColor: colors.ba_color,
                bottomSheet: showsettings == false
                    ? null
                    : Container(
                        height: 400.h,
                        child: Column(
                          children: [
                            size.height(20),
                            Text('Reading Mood',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: colors.text,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.bold)),
                            size.height(20),
                            // read mood buttons
                            Row(
                              children: [
                                // 3 buttons for (arabic - english - both) )
                                size.width(20),
                                // arabic button
                                GestureDetector(
                                  onTap: () {
                                    cubit.setReadingMood('arabic', widget.id!);
                                  },
                                  child: Container(
                                    width: 100.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: cubit.readingmood == 'arabic'
                                            ? colors.primary
                                            : colors.background),
                                    child: Center(
                                      child: Text(
                                        'Arabic',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: cubit.readingmood == 'arabic'
                                                ? colors.background
                                                : colors.text,
                                            fontFamily: 'Lexend'),
                                      ),
                                    ),
                                  ),
                                ),
                                size.width(10),
                                // english button
                                GestureDetector(
                                  onTap: () {
                                    cubit.setReadingMood('english', widget.id!);
                                  },
                                  child: Container(
                                    width: 100.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: cubit.readingmood == 'english'
                                            ? colors.primary
                                            : colors.background),
                                    child: Center(
                                      child: Text(
                                        'English',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color:
                                                cubit.readingmood == 'english'
                                                    ? colors.background
                                                    : colors.text,
                                            fontFamily: 'Lexend'),
                                      ),
                                    ),
                                  ),
                                ),
                                size.width(10),
                                // both button
                                GestureDetector(
                                  onTap: () {
                                    cubit.setReadingMood('both', widget.id!);
                                  },
                                  child: Container(
                                    width: 100.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: cubit.readingmood == 'both'
                                            ? colors.primary
                                            : colors.background),
                                    child: Center(
                                      child: Text('Both',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: cubit.readingmood == 'both'
                                                  ? colors.background
                                                  : colors.text,
                                              fontFamily: 'Lexend')),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            size.height(20),
                            // font size
                            Text('Font Size   ${cubit.sizefont}',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: colors.text,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.bold)),
                            size.height(10),
                            // slider for font size
                            Slider(
                              min: 10,
                              max: 100,
                              value: cubit.sizefont.toDouble(),
                              onChanged: (value) {
                                cubit.setfontsize(value.toInt());
                              },
                              activeColor: colors.primary,
                              inactiveColor: colors.primary.withOpacity(0.3),
                            ),
                            size.height(20),
                            // font color
                            Text('Font Color',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: colors.text,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.bold)),
                            size.height(10),
                            // 3 colors in circle avatar in row
                            Row(
                              children: [
                                size.width(100),
                                // 3 colors in circle avatar
                                // red color
                                GestureDetector(
                                  onTap: () {
                                    cubit.setcolor(colors.primary);
                                  },
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: colors.primary,
                                  ),
                                ),
                                size.width(10),
                                // blue color
                                GestureDetector(
                                  onTap: () {
                                    cubit.setcolor(colors.text);
                                  },
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: colors.text,
                                  ),
                                ),
                                size.width(10),
                                // green color
                                GestureDetector(
                                  onTap: () {
                                    cubit.setcolor(colors.live_Color);
                                  },
                                  child: CircleAvatar(
                                    radius: 28,
                                    backgroundColor: colors.live_Color,
                                  ),
                                ),
                              ],
                            ),
                            size.height(20),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showsettings = false;
                                });
                              },
                              child: Container(
                                width: 300.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: colors.primary),
                                child: Center(
                                  child: Text('Save',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: colors.background,
                                          fontFamily: 'Lexend',
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                appBar: AppBar(
                  backgroundColor: colors.ba_color,
                  elevation: 0,
                  title: Text(
                    cubit.readingmood == 'english'
                        ? widget.englishname.toString()
                        : widget.name.toString(),
                    style: TextStyle(
                        fontSize: 24.sp,
                        color: colors.text,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: colors.text,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: colors.text,
                      ),
                      onPressed: () {
                        // Navigator.pushNamed(context, AppRouter.search);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: colors.text,
                      ),
                      onPressed: () {
                        setState(() {
                          showsettings = !showsettings;
                        });
                      },
                    ),
                  ],
                ),
                body: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          // opacity: 0.2,
                          image: AssetImage('assats/85215.jpg'),
                          fit: BoxFit.cover)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        size.height(5),
                        widget.id == 1 || widget.id == 9
                            ? size.height(1)
                            : Text(
                                'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                style: TextStyle(
                                    fontSize: 32,
                                    color: colors.text,
                                    fontFamily: 'Lexend',
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                        size.height(15),
                        cubit.readingmood == 'both'
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height - 200.h,
                                child: ListView.separated(
                                  itemCount: cubit.surah.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        size.height(15),
                                        Text(
                                          cubit.surah[index]['text']
                                              .toString()
                                              .replaceAll(
                                                  'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                                  ''),
                                          style: TextStyle(
                                              fontSize:
                                                  cubit.sizefont.toDouble(),
                                              color: cubit.color,
                                              fontFamily: 'Lexend',
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                        ),
                                        size.height(10),
                                        Text(
                                          cubit.surah2[index]['text']
                                              .toString()
                                              .replaceAll(
                                                  'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                                                  ''),
                                          style: TextStyle(
                                            fontSize: cubit.sizefont.toDouble(),
                                            color: cubit.color,
                                            fontFamily: 'Lexend',
                                          ),
                                          textAlign: TextAlign.left,
                                          textDirection: TextDirection.ltr,
                                        ),
                                        size.height(15),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return Container(
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        color: colors.background,
                                      ),
                                      child: Row(
                                        children: [
                                          size.width(30),
                                          Text(
                                              '\u06DD' +
                                                  convertNumberToArabic(cubit
                                                      .surah[index]
                                                          ['numberInSurah']
                                                      .toString()),
                                              style: TextStyle(
                                                  fontSize: 24.sp,
                                                  color: colors.text,
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.bold)),
                                          size.width(170),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.bookmark_border,
                                                color: colors.text,
                                              )),
                                          size.width(2),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.copy,
                                                color: colors.text,
                                              )),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            : RichText(
                                textAlign: TextAlign.center,
                                textDirection: cubit.readingmood == 'english'
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                                text: TextSpan(children: [
                                  for (int i = 0;
                                      i < cubit.surah.length;
                                      i++) ...{
                                    TextSpan(
                                        text: widget.id != 1
                                            ? cubit.surah[i]['text']
                                                    .toString()
                                                    .replaceAll(
                                                        'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ', '') +
                                                '\u06DD' +
                                                convertNumberToArabic(cubit
                                                    .surah[i]['numberInSurah']
                                                    .toString())
                                            : cubit.surah[i]['text'].toString() +
                                                '\u06DD' +
                                                convertNumberToArabic(cubit
                                                    .surah[i]['numberInSurah']
                                                    .toString()),
                                        style: TextStyle(
                                            fontSize: cubit.sizefont.toDouble(),
                                            color: cubit.color,
                                            fontFamily: 'Lexend',
                                            fontWeight: FontWeight.bold))
                                  }
                                ])),
                      ],
                    ),
                  ),
                ));
          }
        },
      ),
    );
  }
}
