import 'package:bootcamp/Features/Muslim/muslim_features/Ui/Widget/Azkar_Item.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/Ui/Widget/duaa_item.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/data/azker_model.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/data/duaa_model.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DuaaSceen extends StatefulWidget {
  const DuaaSceen({super.key});

  @override
  State<DuaaSceen> createState() => _DuaaSceenState();
}

class _DuaaSceenState extends State<DuaaSceen> {
  final List<List<Duaa>> duaamodel = [duaafromQuranList, duaafromanbya2List];
  int selected = 0;
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
          'Duaa',
          style: TextStyle(
              fontSize: 25.sp,
              color: colors.text,
              fontFamily: 'Lexend',
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            size.height(15),

            //ListView

            Container(
              height: 60.h,
              padding: EdgeInsets.only(left: 5.w, right: 10.w),
              child: ListView.builder(
                  itemCount: duaacategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${duaacategories[index]}',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: selected == index
                                      ? colors.background
                                      : colors.primary,
                                  fontFamily: 'Lexend',
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        margin: EdgeInsets.only(left: 10.w),
                        width: 150.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: colors.primary),
                            color: selected == index
                                ? colors.primary
                                : colors.background,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  }),
            ),
            size.height(10),
            //List view ver
            Container(
              height: MediaQuery.sizeOf(context).height - 200,
              child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  itemCount: duaamodel[selected].length,
                  itemBuilder: (context, index) {
                    return DuaaItem(duaamodel: duaamodel[selected][index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
