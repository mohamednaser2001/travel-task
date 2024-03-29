
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/constants/navigation_method.dart';
import 'package:travel/screens/home_screen.dart';
import 'package:travel/widgets/custom_button.dart';

import '../constants/colors.dart';

class RequestAcceptedScreen extends StatelessWidget {
  const RequestAcceptedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0.h, horizontal: 36.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تم قبول الطلب, يمكنك حجز تذاكر الطيران الأن ليتم تأكيد الطلب',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 70.h,),

                CustomButton(
                    text: 'طيران',
                    function: (){
                      navigateTo(context, const HomeScreen());
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
