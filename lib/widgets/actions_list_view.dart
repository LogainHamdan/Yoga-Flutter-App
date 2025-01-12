import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionsListView extends StatelessWidget {
  const ActionsListView({
    super.key,
    required this.actions,
  });

  final List<Map<String, dynamic>> actions;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final action = actions[index]; // Access the action from the list
        return ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/yoga1.jpg',
                  // Use a dynamic image if available
                  height: 180.h,
                  // Adjusted for better layout
                  width: 300.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 115.sp, // Adjust horizontal alignment as needed
                right: 0,
                bottom: 130.sp, // Vertical positioning of the block
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align content to the start
                  children: [
                    Text(
                      '${action['text']}', // Dynamically show the action text
                      textAlign: TextAlign.left, // Align text to the left
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
                    // Add spacing between the text and the row
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.start, // Align row content to start
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.sp),
                          child: Icon(
                            CupertinoIcons.timer,
                            color: Colors.white,
                            size: 8.sp,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          ' ${action['time']} ${action['timeunit']}', // Dynamically show time
                          style: TextStyle(
                            fontFamily: 'Poppines',
                            color: Colors.white,
                            fontSize: 8.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemCount: actions.length, // Use the length of the dynamic list
    );
  }
}
