import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';



class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    required this.function,
    this.color =AppColors.primaryColor,
    this.iconColor =Colors.black,
    this.textColor = Colors.white,
    this.withBorder=false,
    this.radius=10,
    this.height=40,
    this.fontSize=15,
    this.width=double.infinity,
    this.icon,
    this.elevation=0,

  }) : super(key: key);

  String text;
  Function function;
  Color color =AppColors.primaryColor;
  Color iconColor =Colors.black;
  Color textColor = Colors.white;
  bool withBorder=false;
  double radius;
  double height;
  double fontSize=14;
  double width=double.infinity;
  IconData? icon;
  double elevation=2;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side:withBorder ? const BorderSide(width: 2.0,color: AppColors.primaryColor) : BorderSide.none,
      ),
      color: color,
      height:height,
      minWidth:width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(icon!=null)
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Icon(icon, color: iconColor.withOpacity(0.7),),
            ),
          Text(
            text,
            style:GoogleFonts.poppins(
              color: textColor,
              fontSize: fontSize.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      onPressed: (){
        function();
      },
    );
  }
}
