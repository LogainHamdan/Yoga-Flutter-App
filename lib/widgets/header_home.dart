import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/widgets/animated-circle.dart';
import '../core/util/constants.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AnimatedCircle(),
            SizedBox(width: 8.w),
            _buildWelcomeMessage(),
          ],
        ),
        _buildFavoriteIcon(),
      ],
    );
  }
}

Widget _buildWelcomeMessage() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Enjoy Your Day, Ann',
        style: TextStyle(
          fontSize: 8.sp,
          color: Colors.white,
          fontFamily: 'Poppines',
        ),
      ),
      Text(
        'Today\'s Plan',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: Colors.white,
          fontFamily: 'Poppines',
        ),
      ),
    ],
  );
}

Widget _buildFavoriteIcon() {
  return Container(
    height: 50.h,
    width: 50.w,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: containerBackgroundColor,
      border: Border.all(color: Colors.grey[700]!),
    ),
    child: Icon(
      Icons.favorite,
      color: kprimaryColor,
      size: 20.sp,
    ),
  );
}
