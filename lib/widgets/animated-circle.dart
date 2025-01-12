import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/util/constants.dart';

class AnimatedCircle extends StatefulWidget {
  const AnimatedCircle({Key? key}) : super(key: key);

  @override
  State<AnimatedCircle> createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int? selectedContainerIndex;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 50.w,
          height: 70.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  '76%',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                    color: Colors.white,
                    fontFamily: 'Poppines',
                  ),
                ),
              ),
              ShaderMask(
                shaderCallback: (rect) {
                  return SweepGradient(
                    startAngle: 0.0,
                    endAngle: 2 * pi,
                    colors: [Colors.purple, kprimaryColor, Colors.purple],
                    stops: [
                      _controller.value,
                      _controller.value + 0.3,
                      _controller.value + 0.6,
                    ].map((stop) => stop % 1.0).toList(),
                  ).createShader(rect);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4.w),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
