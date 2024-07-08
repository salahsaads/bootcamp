import 'package:bootcamp/Features/Muslim/muslim_features/data/duaa_model.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DuaaItem extends StatefulWidget {
  const DuaaItem({
    super.key,
    required this.duaamodel,
  });

  final Duaa? duaamodel;

  @override
  State<DuaaItem> createState() => _Azhar_ItemState();
}

class _Azhar_ItemState extends State<DuaaItem> {
  late int number = widget.duaamodel!.count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.w),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              size.height(10),
              Text(
                textAlign: TextAlign.center,
                '${widget.duaamodel!.content}',
                style: TextStyle(
                    fontSize: 12.sp,
                    color: colors.text,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.bold),
              ),
              size.height(10),
              Text(
                textAlign: TextAlign.center,
                '${widget.duaamodel!.description}',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: colors.subtext,
                  fontFamily: 'Lexend',
                ),
              ),
              size.height(10),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (number != 0) number--;
                  });
                  print(number);
                },
                child: CircleAvatar(
                  radius: 27.r,
                  backgroundColor:
                      number != 0 ? colors.primary : colors.live_Color,
                  child: Text('${number}'),
                ),
              ),
              size.height(10),
            ],
          ),
        ),
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        height: 300.h,
        decoration: BoxDecoration(
            border: Border.all(color: colors.primary, width: 2.w),
            color: colors.background,
            image: DecorationImage(
                image: AssetImage('assats/85215.jpg'), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
