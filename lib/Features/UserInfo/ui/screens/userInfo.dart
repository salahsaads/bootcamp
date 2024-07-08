import 'package:bootcamp/Features/Auth/Ui/widget/textfield.dart';
import 'package:bootcamp/Features/Home/Ui/home.dart';
import 'package:bootcamp/Features/UserInfo/cubit/cubit/user_info_cubit.dart';
import 'package:bootcamp/Features/UserInfo/ui/widgets/phoneTextfeild.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  double age = 0;
  bool male = true;
  String? code;
  Country? pagecountry;
  String city = "";

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoCubit(),
      child: BlocConsumer<UserInfoCubit, UserInfoState>(
        listener: (context, state) {
          if (state is GetcitiesLoading) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: colors.background,
              content: Text(
                'Loading...',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: colors.primary,
                    fontFamily: 'Lexend'),
              ),
            ));
          }
          if (state is SendUserDataFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: colors.background,
              content: Text(
                state.failed!,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: colors.primary,
                    fontFamily: 'Lexend'),
              ),
            ));
          }
          if (state is SendUserDataLoaded) {
            context.navigateTo(Home());
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<UserInfoCubit>(context);

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    size.height(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Profile Information',
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: colors.text,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    size.height(20),
                    textfeild(
                        textEditingController: name,
                        iconname: null,
                        hint: 'Name',
                        title: 'Name',
                        passwordl: false),
                    Column(
                      children: [
                        // text field title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Phone',
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
                              code == null
                                  ? IconButton(
                                      onPressed: () {
                                        showCountryPicker(
                                          context: context,
                                          showPhoneCode:
                                              true, // optional. Shows phone code before the country name.
                                          onSelect: (Country country) {
                                            print(
                                                'Select country: ${country.countryCode}');
                                            setState(() {
                                              code = country.countryCode;
                                              pagecountry = country;

                                              cubit.getCities(
                                                  country.name.toString());
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
                                            print(
                                                'Select country: ${country.countryCode}');
                                            setState(() {
                                              code = country.countryCode;
                                              pagecountry = country;
                                              cubit.getCities(
                                                  country.name.toString());
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
                                  : state is GetcitiesLoaded
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 80.w,
                                            height: 20.h,
                                            child: DropdownButton(
                                              value: city.isEmpty
                                                  ? cubit.cities[0]
                                                  : city,
                                              items: [
                                                for (int i = 0;
                                                    i < cubit.cities.length;
                                                    i++) ...{
                                                  DropdownMenuItem(
                                                    child:
                                                        Text(cubit.cities[i]),
                                                    value: '${cubit.cities[i]}',
                                                  )
                                                }
                                              ],
                                              onChanged: (value) {
                                                setState(() {
                                                  city = value as String;
                                                });
                                              },
                                            ),
                                          ),
                                        )
                                      : size.width(3),

                              //    size.width(10),
                              // phone field
                              Container(
                                width: 150.w,
                                child: TextField(
                                  controller: phone,
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
                                        borderSide: BorderSide(
                                            color: colors.sub_backround,
                                            width: 0)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: colors.sub_backround,
                                            width: 0)),
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
                    ),
                    size.height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: colors.text,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    size.height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 250.w,
                          child: Slider(
                            thumbColor: colors.background,
                            value: age,
                            onChanged: (value) {
                              setState(() {
                                age = value;
                              });
                            },
                            min: 0,
                            max: 100,
                            activeColor: colors.primary,
                            inactiveColor: colors.primary.withOpacity(0.3),
                          ),
                        ),
                        size.width(8),
                        // age value
                        Text(
                          age.toStringAsFixed(0),
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: colors.text,
                              fontFamily: 'Lexend',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    size.height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Gender',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: colors.text,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lexend')),
                      ],
                    ),
                    size.height(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 250.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                            color: colors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              size.width(5),
                              // male and female buttons
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    male = true;
                                  });
                                },
                                child: Container(
                                  width: 120.w,
                                  height: 52.h,
                                  decoration: BoxDecoration(
                                    color: male == true
                                        ? colors.background
                                        : colors.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      // male icon and Male text
                                      size.width(10),

                                      Icon(
                                        Icons.male,
                                        size: 23.sp,
                                        color: male == true
                                            ? colors.primary
                                            : colors.background,
                                      ),
                                      size.width(5),
                                      Text('Male',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              color: male == true
                                                  ? colors.primary
                                                  : colors.background,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Lexend'))
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    male = false;
                                  });
                                },
                                child: Container(
                                  width: 120.w,
                                  height: 52.h,
                                  decoration: BoxDecoration(
                                    color: male == true
                                        ? colors.primary
                                        : colors.background,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      // female icon and Female text

                                      size.width(10),

                                      Icon(
                                        Icons.female,
                                        size: 23.sp,
                                        color: male == true
                                            ? colors.background
                                            : colors.primary,
                                      ),

                                      size.width(5),

                                      Text(
                                        'Female',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: male == true
                                                ? colors.background
                                                : colors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Lexend'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    // save button
                    size.height(50),
                    GestureDetector(
                      onTap: () {
                        cubit.sendUserData(
                          name.text,
                          pagecountry!.name.toString(),
                          city,
                          phone.text,
                          age.round().toString(),
                          male == true ? 'Male' : 'Female',
                        );
                      },
                      child: Container(
                          width: 300.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                            color: colors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                                state is SendUserDataLoading
                                    ? 'Loading...'
                                    : 'Save changes',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: colors.background,
                                    fontFamily: 'Lexend')),
                          )),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
