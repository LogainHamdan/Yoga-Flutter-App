import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/core/util/constants.dart';
import '../data/smile_path.dart';
import '../widgets/custom-elevated-button.dart';
import '../widgets/custom_nav_bar.dart';

class Therapy extends StatelessWidget {
  static const id = '/therapy';

  const Therapy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor:
            kscaffoldBackgroundColor, // Background color for better contrast
        body: ScreenUtilInit(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.0.sp, bottom: 100.sp),
                  child: Text(
                    textAlign: TextAlign.center,
                    'How do you feel \ntoday?',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontFamily: 'Poppines',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.r), // Spac
                  // e for the outer shadow
                  child: Container(
                    decoration: BoxDecoration(
                      shape:
                          BoxShape.circle, // Ensures the container is circular
                      boxShadow: [
                        // Outer shadow (like the outer border)

                        // Inner shadow with a different color
                        BoxShadow(
                          color: Colors.brown[100]!,
                          offset: Offset(3,
                              3), // Adjust the offset to change shadow position
                          blurRadius:
                              20, // Controls the blur radius of the shadow
                          spreadRadius:
                              -3, // Negative spread radius creates a more "inner" effect
                        ),
                        BoxShadow(
                          color: Colors.yellow[300]!, // Outer shadow color
                          offset: Offset(0, 0),
                          blurRadius:
                              12, // Controls the spread of the outer shadow
                          spreadRadius:
                              2, // Controls the spread of the outer shadow
                        ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors
                            .transparent, // Transparent so only shadow is visible
                      ),
                      padding:
                          EdgeInsets.all(5.sp), // Space for the inner shadow
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/smile.png',
                          height: 150.h, // Adjust size as needed
                          width: 150.w,
                          fit: BoxFit
                              .cover, // Ensures the image fits properly within the circle
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 8.0.sp, bottom: 40.sp, left: 10.sp, right: 10.sp),
                  child: Row(
                    children: List.generate(
                      smilePaths.length * 2 - 1,
                      (index) {
                        if (index.isEven) {
                          // Smiley with description
                          int smileIndex = index ~/ 2;
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                smilePaths[smileIndex]['img']!,
                                height:
                                    (smilePaths[smileIndex]['height'] as num)
                                        .toDouble(), // Convert to double
                                width: (smilePaths[smileIndex]['width'] as num)
                                    .toDouble(), // Convert to double
                                fit: BoxFit.cover,
                              ),
                              // SizedBox(height: 10.h),
                              Text(
                                smilePaths[smileIndex]['description']!,
                                style: TextStyle(
                                  fontFamily: 'Poppines',
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container(
                            height: 2.h,
                            width: 16.w,
                            color: Colors.grey[400],
                          );
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  title: 'Note Mood',
                ),
                SizedBox(
                  height: 16.h,
                ),
                BottomNavigationBarCustom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
