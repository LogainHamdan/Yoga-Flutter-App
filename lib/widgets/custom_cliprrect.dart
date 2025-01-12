import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/core/util/constants.dart';

class CustomClipRRect extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final double borderRadius;
  final String action;
  final String? text1;
  final IconData? icon1;
  final String? text2;
  final IconData? icon2;

  const CustomClipRRect({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.action,
    this.text1,
    this.icon1,
    this.text2,
    this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: Stack(
        children: [
          // Background Image
          Image.asset(
            image,
            height: height.h,
            width: width.w,
            fit: BoxFit.cover,
          ),
          // Action Text in Top-Left
          Positioned(
            top: 10.sp, // Top padding
            left: 10.sp, // Left padding
            child: Text(
              action,
              style: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.7),
                    offset: Offset(3.0, 3.0),
                  ),
                ],
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppines',
                color: Colors.white,
                fontSize: 14.sp,
              ),
            ),
          ),
          // Bottom text and icon
          if (text1 != null || icon1 != null)
            Positioned(
              left: 20.sp,
              bottom: 20.sp,
              child: Row(
                children: [
                  Column(
                    children: [
                      if (icon1 != null)
                        Icon(
                          icon1,
                          size: 14.sp,
                          color: kprimaryColor,
                        ),
                      if (icon2 != null)
                        Icon(
                          icon2,
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
                      if (text1 != null)
                        Text(
                          text1!,
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
                      if (text2 != null)
                        Text(
                          text2!,
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
    );
  }
}
