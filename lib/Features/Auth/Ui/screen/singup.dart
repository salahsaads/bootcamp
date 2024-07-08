import 'package:bootcamp/Features/Auth/Ui/screen/singin.dart';
import 'package:bootcamp/Features/Auth/Ui/widget/textfield.dart';
import 'package:bootcamp/Features/Auth/cubit/cubit/auth_cubit.dart';
import 'package:bootcamp/Features/Naiv/Naiv.dart';
import 'package:bootcamp/Features/UserInfo/ui/screens/userInfo.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:bootcamp/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    size.height(40),
                    //hello text
                    Text('Hello.',
                        style: TextStyle(
                            fontSize: 25.sp,
                            color: colors.text,
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.bold)),
                    size.height(20),
                    // 'Welcome back. text

                    Text('Welcome back.',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: colors.subtext,
                            fontFamily: 'Lexend')),

                    size.height(30),

                    //email text feild

                    textfeild(
                      textEditingController: email,
                      title: 'Email',
                      hint: 'Enter email',
                      passwordl: false,
                      iconname: Icon(Icons.email_outlined),
                    ),
                    //password text feld
                    size.height(30),
                    textfeild(
                      textEditingController: password,
                      passwordl: true,
                      hint: 'Enter password',
                      title: 'Password',
                      iconname: Icon(Icons.lock_open),
                    ),

                    //forget password
                    size.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        Text('I agree with ',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: colors.text,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.normal)),
                        Text('Terms & Conditions ',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: colors.primary,
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    size.height(20),
                    // sing up button
                    GestureDetector(
                      onTap: () async {
                        if (password.text.isNotEmpty && email.text.isNotEmpty) {
                          String re = await cubit.SingUp(
                              email.text.trim(), password.text.trim());
                          if (re == 'done') {
                            context.navigateTo(Userinfo());
                          } else {
                            SnackBar(
                              content: Text(re),
                            );
                            print(re);
                          }
                        } else {
                          print('please fill the fields');
                        }
                      },
                      child: Container(
                        width: 300.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        child: Text(
                          state is SingUPLoading ? 'Loading..' : 'Sign Up',
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: colors.background,
                              fontFamily: 'Manrope'),
                        ),
                        decoration: BoxDecoration(
                            color: colors.primary,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    size.height(25),

                    // continue with google or facebook

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'OR CONTINUE WITH',
                          style: TextStyle(
                              color: colors.subtext,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Manrope'),
                        )
                      ],
                    ),
                    size.height(10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //google icon

                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colors.sub_backround),
                          child: const Center(
                            child: Icon(
                              size: 40,
                              Bootstrap.google,
                              color: colors.primary,
                            ),
                          ),
                        ),
                        size.width(10),
                        Container(
                          height: 50.h,
                          width: 2.w,
                          color: colors.subtext,
                        ),
                        size.width(10),

                        Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colors.sub_backround),
                          child: const Center(
                            child: Icon(
                              size: 50,
                              Icons.facebook_outlined,
                              color: colors.primary,
                            ),
                          ),
                        )
                      ],
                    ),

                    size.height(20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: colors.text,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Manrope'),
                        ),
                        size.width(20),
                        GestureDetector(
                          onTap: () {
                            context.navigateTo(Singin());
                          },
                          child: Text(
                            'Sign In now!',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: colors.primary,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Manrope'),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }, listener: (context, state) {
          if (state is SingUPLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: colors.primary,
                content: Text(
                  state.re,
                  style: TextStyle(color: colors.text),
                )));
          }
        }));
  }
}
