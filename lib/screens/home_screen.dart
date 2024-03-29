

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/constants/navigation_method.dart';
import 'package:travel/screens/travel_data_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Row(
                children: [

                  HomeButton(
                    text: 'فنادق',
                    iconPath: 'assets/icons/hotel.png',
                    function: (){

                    },
                  ),
                  SizedBox(width: 20.w,),
                  HomeButton(
                    text: 'طيران',
                    iconPath: 'assets/icons/travel.png',
                    function: (){

                    },
                  ),
                  SizedBox(width: 20.w,),
                  HomeButton(
                    text: 'ضيف',
                    iconPath: 'assets/icons/destination.png',
                    function: (){
                      navigateTo(context, TravelDataScreen());
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton({Key? key, required this.text, required this.iconPath, required this.function}) : super(key: key);

  final String text;
  final String iconPath;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          function();
        },
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[200]!,
                    spreadRadius: 9,
                    blurRadius: 15,
                    offset: const Offset(0.5,0.5)
                )
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(iconPath, width: 40.r,),
              SizedBox(height: 6.h,),
              Text(
                  text,
              style: TextStyle(
                fontSize: 22.sp,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
