import 'package:bootcamp/Features/Auth/Ui/screen/singin.dart';
import 'package:bootcamp/Features/Auth/Ui/screen/singup.dart';
import 'package:bootcamp/Features/Home/Ui/home.dart';
import 'package:bootcamp/Features/Muslim/muslim_features/Ui/screen/Azker.dart';
import 'package:bootcamp/Features/Naiv/Naiv.dart';
import 'package:bootcamp/Features/UserInfo/ui/screens/userInfo.dart';

import 'package:bootcamp/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('en'),
        // locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: Test(),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (snapshot.data == null) {
          return const Singin();
        } else {
          return const navi();
        }
      },
    );
  }
}
