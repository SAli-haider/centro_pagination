import 'package:assesment_test/screens/home/home.dart';
import 'package:assesment_test/utils/pallets/pallets.dart';
import 'package:assesment_test/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BottomNavigation> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    const Center(child: Text("Directory")),
    const Center(child: Text("Boarding List")),
    Home(),
    const Center(child: Text("Evaluation")),
    const Center(child: Text("More")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: _selectedIndex == 2 ? Pallets.primary : Colors.grey,
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            _selectedIndex = 2; // Switch to "Event"
          });
        },
        child: Image.asset(
          "assets/images/calendar (15) 1.png",
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.white,
        height: 65.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Expanded(
                  child: _buildNavItem(
                      "assets/images/contact-book (2) 2.png", "Directory", 0)),
              Expanded(
                  child: _buildNavItem(
                      "assets/images/checklist (3) 2.png", "Boarding List", 1)),
              const SizedBox(width: 60),
              Expanded(
                  child: _buildNavItem(
                      "assets/images/evaluation (1) 2.png", "Evaluation", 3)),
              Expanded(
                  child:
                      _buildNavItem("assets/images/more (1) 2.png", "More", 4)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String imagePath, String label, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (index != 2)
            Image.asset(
              imagePath,
              height: 22.h,
              width: 22.w,
              color: isSelected ? Pallets.primary : Colors.black,
            ),
          SizedBox(height: 4.h),
          FittedBox(
            child: CustomText.customText(
              text: label,
              fontSize: 10.0.sp,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              color: isSelected ? Pallets.primary : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
