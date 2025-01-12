import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/widgets/days-list.dart';
import '../core/util/constants.dart';
import '../data/actions.dart';
import '../widgets/actions_list_view.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/custom_slider.dart';
import '../widgets/header_home.dart';

class Home extends StatefulWidget {
  static const id = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> actions = getActions;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: kscaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 600.h, // Upper container height
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40.r),
                    bottomLeft: Radius.circular(40.r),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 30.0.sp, left: 16.sp, right: 16.sp),
                      child: HomeHeader(),
                    ),
                    SizedBox(height: 16.h),
                    const DaysListView(),
                    // SizedBox(height: 8.h),
                    SizedBox(
                      height: 400.h,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.0.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 8.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 80.0.sp),
                              child: Container(
                                  height:
                                      300.h, // Adjust the height of the slider
                                  width: 50.w, // Width of the slider
                                  child: Transform.translate(
                                    offset: Offset(-2.0,
                                        0), // Shifting 2 units to the left (horizontal offset)
                                    child: Transform.rotate(
                                      angle:
                                          0.03, // Apply rotation (in radians) to make the image oblique
                                      child: Image.asset(
                                        'assets/images/slider.png',
                                        width: 50.w,
                                        height: 500.h,
                                      ),
                                    ),
                                  )),
                            ),
                            Expanded(child: ActionsListView(actions: actions)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              BottomNavigationBarCustom(),
            ],
          ),
        ),
      ),
    );
  }
}
