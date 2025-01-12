import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga_app/screens/explore.dart';
import 'package:yoga_app/screens/home.dart';
import 'package:yoga_app/screens/profile.dart';
import 'package:yoga_app/screens/therapy.dart';

import 'core/util/constants.dart';

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          // debugShowCheckedModeBanner: false,
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: Locale('en'),
          title: 'YOGA',
          theme: ThemeData(
            fontFamily: 'Poppins',
            iconTheme: const IconThemeData(color: Color(0xffB2B2B2)),
            textTheme: TextTheme(
                bodySmall: GoogleFonts.poppins(
                    color: const Color(0xffB2B2B2), fontSize: 12),
                bodyMedium: GoogleFonts.poppins(
                    color: const Color(0xff272727), fontSize: 18)),
            appBarTheme: const AppBarTheme(backgroundColor: Color(0xffF7F6FF)),
            scaffoldBackgroundColor: kscaffoldBackgroundColor,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // useMaterial3: true,
          ),
          initialRoute: Home.id,
          routes: {
            Home.id: (context) => Home(),
            Therapy.id: (context) => Therapy(),
            Profile.id: (context) => Profile(),
            Explore.id: (context) => Explore(),
          },
        );
      },
    );
  }
}
