import 'package:bootcamp/core/theming/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCircler extends StatelessWidget {
  const ItemCircler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: colors.primary,
            radius: 30.r,
          ),
          Positioned(
            right: 0,
            bottom: 25,
            child: Container(
              alignment: Alignment.center,
              child: Text('Live', style: TextStyle(color: colors.background)),
              width: 30.w,
              height: 20.w,
              decoration: BoxDecoration(
                  color: colors.live_Color,
                  borderRadius: BorderRadius.circular(10.r)),
            ),
          )
        ],
      ),
    );
  }
}
