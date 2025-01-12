import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:yoga_app/providers/navigation.dart';
import 'app_localization.dart';
import 'my_material_app.dart';

// void main() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // await EasyLocalization.ensureInitialized();
//
//   runApp(MyApp({super.key})
//       // EasyLocalization(
//       //   supportedLocales: [
//       //     Locale('en', 'US'),
//       //     Locale('ar', 'EG')
//       //   ], // Add other supported l
//       //   // ocales as needed
//       //   path: 'assets/translations', // Path to your translation files
//       //   fallbackLocale: Locale('en', 'US'),
//       //   child: const MyApp(),
//       // ),
//       );
// }

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiProvider(providers: [
        ChangeNotifierProvider<NavigationProvider>(
            create: (context) => NavigationProvider()),
      ], child: MyMaterialApp()),
    );
  }
}
