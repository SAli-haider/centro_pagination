import 'package:assesment_test/provider/product_provider.dart';
import 'package:assesment_test/utils/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String designation;
  final String date;

  const CustomListTile({
    super.key,
    required this.imagePath,
    required this.name,
    required this.designation,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 23.w),
      //padding: const EdgeInsets.all(10),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.grey),
            child: CachedNetworkImage(
              imageUrl: imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: CustomText.customText(
          text: name,
          maxLines: 1,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.customText(
                text: designation,
                fontSize: 10.sp,
                color: Colors.grey[700],
                fontWeight: FontWeight.w600),
            CustomText.customText(
                text: date, fontSize: 10.sp, color: Colors.grey[500]),
          ],
        ),
      ),
    );
  }
}

class ListTileScreen extends StatelessWidget {
  const ListTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.productList.length + (value.loading ? 1 : 0),
          shrinkWrap: true,
          cacheExtent: 1.sh * 2,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            if (value.loading && index == value.productList.length) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final employee = value.productList[index];
            return CustomListTile(
              imagePath: employee["featured_image"]!,
              name: employee["product_name_en"] ?? 'N/A',
              designation: employee["category_title_en"] ?? 'N/A',
              date: "Thursday 23, 2023",
            );
          },
        );
      },
    );
  }
}
