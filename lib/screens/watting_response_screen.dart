
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/constants/colors.dart';
import 'package:travel/constants/navigation_method.dart';
import 'package:travel/screens/profile_screen.dart';
import 'package:travel/screens/request_accepted_screen.dart';
import 'package:travel/widgets/custom_button.dart';

class WaitingResponseScreen extends StatelessWidget {
  const WaitingResponseScreen({Key? key}) : super(key: key);

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

                CustomButton(
                    text: 'إرسال',
                    function: (){}
                ),
                SizedBox(height: 30.h,),

                CustomButton(
                    text: 'انتظار',
                    function: (){}
                ),

                SizedBox(height: 30.h,),

                CustomButton(
                    text: 'قبول / رفض',
                    function: (){
                      // navigateTo(context, RequestAcceptedScreen());
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
