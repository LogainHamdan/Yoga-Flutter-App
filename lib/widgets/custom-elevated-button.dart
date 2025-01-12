import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../core/util/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
            Size(MediaQuery.of(context).size.width - 50.w, 50.h)),
        elevation: WidgetStateProperty.all(10),
        backgroundColor: WidgetStateProperty.all(
          kprimaryColor,
        ),
        shadowColor: WidgetStateProperty.all(Colors.white.withOpacity(0.3)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title!,
        style: TextStyle(
            fontFamily: 'Poppines',
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
