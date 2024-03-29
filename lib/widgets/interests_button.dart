

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../screens/travel_data_screen.dart';

class InterestsButton extends StatelessWidget {
  const InterestsButton(
      {Key? key, required this.interestsModel, required this.function})
      : super(key: key);

  final InterestsModel interestsModel;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              function();
            },
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: AppColors.lighterGray,
                  borderRadius: BorderRadius.circular(10.r),
                  border: interestsModel.isSelected
                      ? Border.all(color: AppColors.primaryColor, width: 1.3)
                      : null,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[100]!,
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: const Offset(0.5, 0.5))
                  ]),
              child: Image.asset(
                interestsModel.iconPath,
                width: 26.r,
                color: interestsModel.isSelected
                    ? AppColors.primaryColor
                    : Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            interestsModel.text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              height: 1,
              color: interestsModel.isSelected
                  ? AppColors.primaryColor
                  : Colors.black87,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
