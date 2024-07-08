import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class phonetextfield extends StatefulWidget {
  phonetextfield({
    required this.textfieldname,
    super.key,
  });

  String? textfieldname;

  @override
  State<phonetextfield> createState() => _phonetextfieldState();
}

class _phonetextfieldState extends State<phonetextfield> {
  String? code;
  Country? pagecountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // text field title
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.textfieldname!,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: colors.text,
                  fontFamily: 'Manrope'),
            ),
          ],
        ),
        size.height(10),
        // text field
        Container(
          width: 300.w,
          height: 50.h,
          child: Row(
            children: [
              //   size.width(10),
              // code field
              // Container(
              //   width: 70.w,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       fillColor: colors.sub_backround,
              //       filled: true,
              //       hintText: 'Code',
              //       hintStyle: TextStyle(
              //           fontSize: 16.sp,
              //           fontWeight: FontWeight.normal,
              //           color: colors.subtext,
              //           fontFamily: 'Manrope'),
              //       enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide:
              //               BorderSide(color: colors.sub_backround, width: 0)),
              //       focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide:
              //               BorderSide(color: colors.sub_backround, width: 0)),
              //     ),
              //   ),
              // ),

              code == null
                  ? IconButton(
                      onPressed: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode:
                              true, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            print('Select country: ${country.countryCode}');
                            setState(() {
                              code = country.countryCode;
                              pagecountry = country;
                            });
                          },
                        );
                      },
                      icon: Icon(
                        Icons.flag_circle,
                        size: 30.sp,
                        color: colors.primary,
                      ))
                  : GestureDetector(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode:
                              true, // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            print('Select country: ${country.countryCode}');
                            setState(() {
                              code = country.countryCode;
                              pagecountry = country;
                            });
                          },
                        );
                      },
                      child: Text(
                        '${pagecountry!.flagEmoji}',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    ),

              code == null
                  ? size.width(3)
                  : Container(
                      child: DropdownButton(
                        items: [
                          for (int i = 0; i < 10; i++) ...{
                            DropdownMenuItem(
                              child: Text('Salah'),
                              value: '',
                            )
                          }
                        ],
                        onChanged: (value) {},
                      ),
                    ),

              //    size.width(10),
              // phone field
              Container(
                width: 210.w,
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: colors.sub_backround,
                    filled: true,
                    hintText: 'Enter your phone number',
                    hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.normal,
                        color: colors.subtext,
                        fontFamily: 'Manrope'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: colors.sub_backround, width: 0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: colors.sub_backround, width: 0)),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            // color: Color(0xfff3f4f6),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}
