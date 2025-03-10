import 'package:assesment_test/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String locations;
  final String employees;

  const EventCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.locations,
    required this.employees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 138.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 70.h,
              fit: BoxFit.cover,
            ),
          ),
          // SizedBox(height: 5.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.green, size: 11.sp),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: CustomText.customText(
                        text: locations,
                        fontSize: 12.sp,
                        color: Colors.green,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                CustomText.customText(
                  text: employees,
                  fontSize: 12.sp,
                  color: Colors.grey[700],
                ),
                SizedBox(height: 5.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EventListScreen extends StatelessWidget {
  const EventListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> events = [
      {
        "imagePath": "assets/images/image 12.png",
        "title": "Retirement",
        "locations": "Location1, Location2",
        "employees": "5 Employees"
      },
      {
        "imagePath": "assets/images/image 13.png",
        "title": "Graduation",
        "locations": "Location1, Location2",
        "employees": "5 Employees"
      },
      {
        "imagePath": "assets/images/image 12.png",
        "title": "Retirement",
        "locations": "Location1, Location2",
        "employees": "5 Employees"
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: SizedBox(
        height: 144.h,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: events.map((event) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: EventCard(
                  imagePath: event["imagePath"]!,
                  title: event["title"]!,
                  locations: event["locations"]!,
                  employees: event["employees"]!,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
