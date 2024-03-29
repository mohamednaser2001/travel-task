
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/constants/colors.dart';
import 'package:travel/screens/profile_screen.dart';
import 'package:travel/screens/watting_response_screen.dart';

import '../constants/navigation_method.dart';
import '../widgets/custom_button.dart';


class ProfileDetailsScreen  extends StatelessWidget {
  const ProfileDetailsScreen({Key? key, required this.userModel}) : super(key: key);

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 170.w,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 35.h),
                    color: AppColors.lighterGray,
                    child: Image.asset(
                      userModel.backgroundImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CircleAvatar(
                    radius: 64.r,
                    backgroundColor: AppColors.yellowColor,
                    child: CircleAvatar(
                      radius: 62.r,
                      backgroundImage: AssetImage(userModel.image),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20.h,
              ),

              profileRowData(header: 'الاسم', value: userModel.name),
              profileRowData(header: 'الايميل', value: userModel.email),
              profileRowData(header: 'رقم التواصل', value: userModel.phone),
              profileRowData(header: 'الجنسية', value: userModel.nationality),
              profileRowData(header: 'الاهتمامات', value: userModel.interests),
              profileRowData(header: 'اللغة', value: userModel.language),
              profileRowData(header: 'الفعاليات', value: userModel.events),
              profileRowData(header: 'أخرى', value: userModel.other),
              profileRowData(header: 'المبلغ المستحق اليومي', value: userModel.price),



              SizedBox(height: 30.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'الأيام المتاحة',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w,),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: SizedBox(
                        height: 250,
                        child: CalendarDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.utc(2030, 2, 14),
                          onDateChanged: (day) {

                          },
                        ),
                      ),
                    ),
                  ),


              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 26.w),
                child: CustomButton(
                    text: 'التالي',
                    function: (){
                      navigateTo(context, const WaitingResponseScreen());
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileRowData({required String header, required String value}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            header,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: 12.w,),
        Expanded(
          flex: 6,
          child: Container(
            height: 36.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
                color: AppColors.lighterGray,
                borderRadius: BorderRadius.circular(6.r)
            ),
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.black54,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    ));

