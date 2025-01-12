import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/util/constants.dart';
import '../data/days.dart';

class DaysListView extends StatefulWidget {
  const DaysListView({Key? key}) : super(key: key);

  @override
  State<DaysListView> createState() => _DaysListViewState();
}

class _DaysListViewState extends State<DaysListView> {
  int? selectedContainerIndex;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    selectedContainerIndex = 15; // Set the default selected index.
    _scrollController = ScrollController();

    // Scroll to the selected index after the widget is built.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        double scrollToPosition = selectedContainerIndex! *
            58.w; // Adjust based on item width and spacing.
        _scrollController.jumpTo(scrollToPosition);
      }
    });
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); // Dispose of the controller to avoid memory leaks.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(right: 8.0.sp, left: 8.sp),
        child: SizedBox(
          height: 80.h,
          child: ListView.separated(
            controller: _scrollController, // Attach the scroll controller.
            reverse: true,
            scrollDirection: Axis.horizontal,
            itemCount: getDays.length,
            separatorBuilder: (context, index) => SizedBox(width: 8.w),
            itemBuilder: (context, index) {
              final dayData = getDays[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedContainerIndex =
                        selectedContainerIndex == index ? null : index;
                  });
                },
                child: Container(
                  width: 50.w,
                  decoration: BoxDecoration(
                    gradient: selectedContainerIndex == index
                        ? LinearGradient(
                            end: Alignment.topRight,
                            begin: Alignment.bottomLeft,
                            colors: [
                              Colors.deepPurple[900]!,
                              Colors.purple[700]!,
                              kprimaryColor,
                            ],
                            stops: [0.0, 0.3, 0.7],
                          )
                        : null,
                    color: selectedContainerIndex == index
                        ? kprimaryColor
                        : kscaffoldBackgroundColor,
                    border: Border.all(color: containerBackgroundColor),
                    borderRadius: BorderRadius.circular(35.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${dayData['date']}',
                        style: TextStyle(
                          fontSize: 26.sp,
                          color: Colors.white,
                          fontFamily: 'Poppines',
                        ),
                      ),
                      Text(
                        '${dayData['day']}',
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: Colors.white,
                          fontFamily: 'Poppines',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
