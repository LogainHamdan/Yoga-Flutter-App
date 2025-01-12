import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/core/util/constants.dart';
import 'package:yoga_app/main.dart';

import '../widgets/custom_cliprrect.dart';
import '../widgets/custom_nav_bar.dart';

class Explore extends StatelessWidget {
  static const id = '/explore';

  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> actions;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: kscaffoldBackgroundColor,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(16.0.sp),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Your Program\nIs Ready!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.sp,
                                  fontFamily: 'Poppines',
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              'Just 30 minutes a day to change your life',
                              style: TextStyle(
                                  fontFamily: 'Poppines',
                                  fontSize: 14.sp,
                                  color: Colors.white.withOpacity(0.5)),
                            )
                          ],
                        ),
                      ),
                      height: 200.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(35.r),
                            bottomLeft: Radius.circular(35.r)),
                        gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          begin: Alignment.topCenter,
                          colors: [
                            Colors.purple,
                            kprimaryColor,
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.sp, bottom: 8.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.sp,
                            ),
                            child: Icon(
                              Icons.cancel_outlined,
                              color: Colors.white,
                              size: 18.sp,
                            ),
                          ),
                          Text(
                            'What is included?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppines'),
                          ),
                          SizedBox(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomClipRRect(
                                action: 'Guided\nMeditation',
                                borderRadius: 10,
                                image:
                                    'assets/images/DALL·E-2025-01-09-11.12.jpeg',
                                height: 380,
                                width: 200,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Column(
                                children: [
                                  CustomClipRRect(
                                    action: 'Breathing\nExercise',
                                    borderRadius: 10,
                                    image: 'assets/images/bg2.jpg',
                                    height: 185,
                                    width: 120,
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  CustomClipRRect(
                                    action: 'Healthy\nRecipes',
                                    borderRadius: 10,
                                    image: 'assets/images/fruits2.jpg',
                                    height: 190,
                                    width: 120,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.0.sp),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              //   icon1: Icons.elderly_woman,
                              //   text1: 'Beginner',
                              //   icon2: Icons.sports_gymnastics,
                              //   text2: 'Intermediate',
                              child: Stack(
                                children: [
                                  // Background Image
                                  Image.asset(
                                    'assets/images/DALL·E-2025-01-09-11.05.jpeg',
                                    height: 180.h,
                                    width: double.infinity.w,
                                    fit: BoxFit.cover,
                                  ),
                                  // Action Text in Top-Left
                                  Positioned(
                                    top: 20.sp, // Top padding
                                    left: 30.sp, //// Left padding
                                    child: Text(
                                      'Yoga\nClasses',
                                      style: TextStyle(
                                        shadows: [
                                          Shadow(
                                            blurRadius: 10.0,
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            offset: Offset(3.0, 3.0),
                                          ),
                                        ],
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppines',
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10.sp,
                                    bottom: 20.sp,
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Icon(
                                              Icons.elderly_woman,
                                              size: 14.sp,
                                              color: kprimaryColor,
                                            ),
                                            Icon(
                                              Icons.sports_gymnastics,
                                              size: 14.sp,
                                              color: kprimaryColor,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Beginner',
                                              style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius:
                                                        20.0, // Increased blur radius for a softer, more spread shadow
                                                    color: Colors.black.withOpacity(
                                                        0.9), // Higher opacity for a darker shadow
                                                    offset: Offset(5.0,
                                                        5.0), // Increased offset for a more noticeable shadow
                                                  ),
                                                  Shadow(
                                                    blurRadius:
                                                        15.0, // A second shadow for a deeper effect
                                                    color: Colors.black.withOpacity(
                                                        0.5), // Lighter opacity for a subtle effect
                                                    offset: Offset(-5.0,
                                                        -5.0), // Opposite offset for a balanced shadow effect
                                                  ),
                                                ],
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Poppines',
                                                fontSize: 8.sp,
                                              ),
                                            ),
                                            Text(
                                              'Intermediate',
                                              style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    blurRadius:
                                                        20.0, // Increased blur radius for a softer, more spread shadow
                                                    color: Colors.black.withOpacity(
                                                        0.9), // Higher opacity for a darker shadow
                                                    offset: Offset(5.0,
                                                        5.0), // Increased offset for a more noticeable shadow
                                                  ),
                                                  Shadow(
                                                    blurRadius:
                                                        15.0, // A second shadow for a deeper effect
                                                    color: Colors.black.withOpacity(
                                                        0.5), // Lighter opacity for a subtle effect
                                                    offset: Offset(-5.0,
                                                        -5.0), // Opposite offset for a balanced shadow effect
                                                  ),
                                                ],
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Poppines',
                                                fontSize: 8.sp,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    // child: Column(
                                    //   children: [
                                    //     Row(
                                    //       children: [
                                    //         if (icon1 != null)
                                    //           Icon(
                                    //             icon1,
                                    //             size: 14.sp,
                                    //             color: kprimaryColor,
                                    //           ),
                                    //         SizedBox(
                                    //           width: 12.w,
                                    //         ),
                                    //         if (text1 != null)
                                    //           Text(
                                    //             text1!,
                                    //             style: TextStyle(
                                    //               color: Colors.white,
                                    //               fontWeight: FontWeight.w600,
                                    //               fontFamily: 'Poppines',
                                    //               fontSize: 8.sp,
                                    //             ),
                                    //           ),
                                    //       ],
                                    //     ),
                                    //     SizedBox(
                                    //       height: 5.h,
                                    //     ),
                                    //     Row(
                                    //       children: [
                                    //         if (icon2 != null)
                                    //           Icon(
                                    //             icon2,
                                    //             size: 14.sp,
                                    //             color: kprimaryColor,
                                    //           ),
                                    //         if (text2 != null)
                                    //           Text(
                                    //             text2!,
                                    //             style: TextStyle(
                                    //               color: Colors.white,
                                    //               fontWeight: FontWeight.w600,
                                    //               fontFamily: 'Poppines',
                                    //               fontSize: 8.sp,
                                    //             ),
                                    //           ),
                                    //       ],
                                    //     ),
                                    //   ],
                                    // ),
                                  ),
                                ],
                              ),
                            ),
                            // child: CustomClipRRect(
                            //   action: 'Yoga\nClasses',
                            //   height: 180,
                            //   borderRadius: 10,
                            //   width: double.infinity,
                            //   image:
                            //       'assets/images/DALL·E-2025-01-09-11.05.jpeg',
                            //   icon1: Icons.elderly_woman,
                            //   text1: 'Beginner',
                            //   icon2: Icons.sports_gymnastics,
                            //   text2: 'Intermediate',
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomNavigationBarCustom(), // Fixed at the bottom, not inside the scroll view
          ],
        ),
      ),
    );
  }
}
