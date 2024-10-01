import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_styles.dart';
import '../utils/constants.dart';
import 'reusable_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.appbarTitle,
    required this.context,
  });

  final String appbarTitle;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(130.h),
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
          height: 90.h,
          width: MediaQuery.of(context).size.width,
          color: kOffWhite,
          child: Container(
            margin: EdgeInsets.only(top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: 4.h, left: 5.w, top: 7.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined),
                              ReusableText(
                                  text: "Delivery in",
                                  style: appStyle(13, kDark, FontWeight.bold)),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Text(
                              appbarTitle.isEmpty
                                  ? "Fetching Addresses....."
                                  : appbarTitle,
                              overflow: TextOverflow.ellipsis,
                              style: appStyle(12, kDarkGray, FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Icon(Icons.location_on, color: kSecondary, size: 35.sp),
                  ],
                ),
                GestureDetector(
                  child: CircleAvatar(
                    radius: 19.r,
                    backgroundColor: kPrimary,
                    child: Text("A",
                        style: appStyle(18, kWhite, FontWeight.normal)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
