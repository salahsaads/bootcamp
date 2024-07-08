import 'package:bootcamp/Features/Muslim/muslim_features/data/azker_model.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:bootcamp/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Azhar_Item extends StatefulWidget {
  const Azhar_Item({
    super.key,
    required this.zekrModel,
  });

  final ZekrModel? zekrModel;

  @override
  State<Azhar_Item> createState() => _Azhar_ItemState();
}

class _Azhar_ItemState extends State<Azhar_Item> {
  late int number = widget.zekrModel!.count;

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
                '${widget.zekrModel!.content}',
                style: TextStyle(
                    fontSize: textstyle()
                        .fontsize(widget.zekrModel!.content.length, 15),
                    color: colors.text,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.bold),
              ),
              size.height(10),
              Text(
                textAlign: TextAlign.center,
                '${widget.zekrModel!.description}',
                style: TextStyle(
                  fontSize: textstyle()
                      .subfontsize(widget.zekrModel!.description.length),
                  color: colors.subtext,
                  fontFamily: 'Lexend',
                ),
              ),
              size.height(10),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (number != 0) number = number - 1;
                  });
                  print(number);
                  setState(() {});
                },
                child: CircleAvatar(
                  radius: 30.r,
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
