import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoga_app/screens/therapy.dart';
import '../core/util/constants.dart';
import '../providers/navigation.dart';
import '../screens/explore.dart';
import '../screens/home.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return ScreenUtilInit(
      builder: (context, child) => Container(
        color: kscaffoldBackgroundColor, // Matches the scaffold background
        padding: EdgeInsets.only(top: 20.h),
        child: BottomNavigationBar(
          backgroundColor: kscaffoldBackgroundColor, // No visual separation
          elevation: 0, // Removes shadow and dividers
          type: BottomNavigationBarType.fixed, // Fixes the layout
          currentIndex: navigationProvider.currentIndex,
          onTap: (index) {
            navigationProvider.setIndex(index);
            _navigateByIndex(context, index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tag_faces),
              label: 'Therapy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore_sharp),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.white, // Selected icon and text color
          unselectedItemColor: Colors.grey, // Unselected icon and text color
          selectedLabelStyle: TextStyle(
              fontFamily: 'Poppines',
              fontWeight: FontWeight.bold,
              fontSize: 8.sp,
              color: Colors.white),
          unselectedLabelStyle: TextStyle(
              fontFamily: 'Poppines', fontSize: 8.sp, color: Colors.grey),
          showUnselectedLabels: true, // Ensures unselected labels are visible
        ),
      ),
    );
  }

  /// Navigates to the corresponding screen based on the index
  void _navigateByIndex(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
        break;
      case 1:
        Navigator.pushReplacementNamed(context, Therapy.id);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, Explore.id);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, Home.id);
        break;
      default:
        break;
    }
  }
}
