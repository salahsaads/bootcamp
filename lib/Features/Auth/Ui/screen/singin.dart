import 'package:bootcamp/Features/Auth/Ui/screen/singup.dart';
import 'package:bootcamp/Features/Auth/Ui/widget/textfield.dart';
import 'package:bootcamp/Features/Auth/cubit/cubit/auth_cubit.dart';
import 'package:bootcamp/Features/Naiv/Naiv.dart';
import 'package:bootcamp/core/routing/routing.dart';
import 'package:bootcamp/core/theming/Color.dart';
import 'package:bootcamp/core/theming/Size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class Singin extends StatefulWidget {
  const Singin({super.key});

  @override
  State<Singin> createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController forgetemailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, State) {
          if (State is SingInLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: colors.primary,
                content: Text(
                  State.re,
                  style: TextStyle(color: colors.text),
                )));
          }
          if (State is ForgetPasswordLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: colors.primary,
                content: Text(
                  State.response,
                  style: TextStyle(color: colors.text),
                )));
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);

          return Scaffold(
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
                    // TextField(
                    //   focusNode: _focusNode,
                    // ),
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
                      children: [
                        size.width(100),
                        GestureDetector(
                          onTap: () {
                            WoltModalSheet.show<void>(
                              // pageIndexNotifier: pageIndexNotifier,
                              context: context,
                              pageListBuilder: (modalSheetContext) {
                                return [
                                  WoltModalSheetPage(
                                    backgroundColor: colors.ba_color,
                                    child: Container(
                                      height: 300.h,
                                      child: Column(
                                        children: [
                                          size.height(20),
                                          Text('Forget Password?',
                                              style: TextStyle(
                                                  fontSize: 25.sp,
                                                  color: colors.primary,
                                                  fontFamily: 'Lexend',
                                                  fontWeight: FontWeight.bold)),
                                          size.height(20),
                                          textfeild(
                                            textEditingController:
                                                forgetemailController,
                                            title: 'Email',
                                            hint: 'Enter email',
                                            iconname:
                                                Icon(Icons.email_outlined),
                                            passwordl: false,
                                          ),
                                          size.height(20),
                                          GestureDetector(
                                            onTap: () {
                                              cubit.forgetPassword(
                                                  forgetemailController.text);
                                            },
                                            child: Container(
                                              width: 300.w,
                                              height: 50.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: colors.primary),
                                              child: Center(
                                                child: Text(
                                                    state is ForgetPasswordLoading
                                                        ? 'Loading..'
                                                        : 'Send Email',
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        color:
                                                            colors.background,
                                                        fontFamily: 'Lexend')),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ];
                              },
                            );
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: colors.primary,
                                fontFamily: 'Manrope'),
                          ),
                        )
                      ],
                    ),
                    size.height(20),
                    // sing in button
                    GestureDetector(
                      onTap: () async {
                        if (password.text.isNotEmpty && email.text.isNotEmpty) {
                          String re = await cubit.SingIn(
                              email.text.trim(), password.text.trim());
                          if (re == 'done') {
                            context.navigateTo(navi());
                          } else {
                            SnackBar(
                              content: Text(re),
                            );
                            print(re);
                          }
                        } else {}
                      },
                      child: Container(
                        width: 300.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        child: Text(
                          state is SingInLoading ? 'Loading..' : 'Sign In',
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
                          'Don\'t have an account?',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: colors.text,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Manrope'),
                        ),
                        size.width(20),
                        GestureDetector(
                          onTap: () {
                            context.navigateTo(Singup());
                          },
                          child: Text(
                            'Sign Up now!',
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
        },
      ),
    );
  }
}
