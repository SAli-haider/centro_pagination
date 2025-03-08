import 'package:assesment_test/provider/product_provider.dart';
import 'package:assesment_test/screens/home/widget/events.dart';
import 'package:assesment_test/screens/home/widget/parents.dart';
import 'package:assesment_test/utils/pallets/pallets.dart';
import 'package:assesment_test/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          controller: value.scrollController,
          child: Column(
            children: [
              SafeArea(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 160.h,
                      width: double.infinity,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.teal[100],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),
                          CustomText.customText(
                            text: "Team Life Event",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          SizedBox(height: 4.h),
                          CustomText.customText(
                            text: "Check team events",
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -15,
                      right: -10,
                      child: Image.asset(
                        "assets/images/Rectangle 2057.png", // Replace with your image
                        height: 90.h,
                        width: 90.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -15,
                      width: 1.0.sw,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.search, color: Colors.teal),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelStyle: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                    ),
                                    hintStyle: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                    ),
                                    hintText: "Search person, location, role",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                  color: Pallets.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Icon(Icons.filter_list,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText.customText(
                      text: "Team Life Event",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        color: Pallets.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          const Icon(Icons.add, color: Colors.white),
                          SizedBox(
                            width: 5.w,
                          ),
                          CustomText.customText(
                            text: "Add",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const EventListScreen(),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.r),
                  child: CustomText.customText(
                    text: "Become Parent",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTileScreen()
            ],
          ),
        ));
  }
}
