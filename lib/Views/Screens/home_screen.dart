import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Const/color_theme.dart';
import '../Widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Color color = ColorTheme(context).color;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CustomText(
                        title: 'Welcome',
                        color: Colors.cyan,
                        fontSize: 27.sp,
                        isTitle: true,
                      ),
                      CustomText(
                        title: 'Oday',
                        color: color,
                        fontSize: 25.sp,
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.png'),
                    radius: 52,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    margin: const EdgeInsetsDirectional.only(
                      start: 16,
                      end: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: const AssetImage('assets/images/absence.png'),
                          height: 140.h,
                          width: 140.w,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomText(
                          title: 'absence',
                          color: color,
                          fontSize: 25.sp,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    margin: const EdgeInsetsDirectional.only(
                      end: 16,
                      start: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('assets/images/wifi.png'),
                          height: 120.h,
                          width: 120.w,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Column(
                          children: [
                            CustomText(
                              title: 'Connect with',
                              color: color,
                              fontSize: 20.sp,
                              isTitle: true,
                            ),
                            CustomText(
                              title: 'Omar',
                              color: Colors.red,
                              fontSize: 22.sp,
                              isTitle: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              margin: const EdgeInsetsDirectional.only(
                start: 16,
                end: 8,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: CustomText(
                  title: '8 hours   32 minutes',
                  color: color,
                  fontSize: 25.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
