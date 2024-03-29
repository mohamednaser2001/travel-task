import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/constants/navigation_method.dart';
import 'package:travel/screens/profile_screen.dart';
import 'package:travel/widgets/custom_button.dart';
import '../constants/colors.dart';
import '../widgets/interests_button.dart';

class TravelDataScreen extends StatefulWidget {
  const TravelDataScreen({Key? key}) : super(key: key);


  @override
  State<TravelDataScreen> createState() => _TravelDataScreenState();
}

class _TravelDataScreenState extends State<TravelDataScreen> {
  List<String> cities = ['الرياض', 'جدة', 'الدمام', 'المدينة'];
  List<InterestsModel> interests = [
    InterestsModel(text: 'رياضة', iconPath: 'assets/icons/sports1.png'),
    InterestsModel(text: 'تاريخ', iconPath: 'assets/icons/history.png'),
    InterestsModel(text: 'سياحة', iconPath: 'assets/icons/tourism.png'),
    InterestsModel(text: 'ثقافات', iconPath: 'assets/icons/cultures.png'),
    InterestsModel(text: 'ألعاب الكترونية', iconPath: 'assets/icons/games.png'),
    InterestsModel(text: 'تجربة إستثمارية', iconPath: 'assets/icons/profit.png'),
    InterestsModel(text: 'أخرى', iconPath: 'assets/icons/menu.png'),
  ];
  List<int> selectedInterests = [];
  DateTime selectedDate= DateTime.now();

  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 30.h),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderText('الوجهة'),
                Container(
                  height: 40.h,
                  margin: EdgeInsets.only(top: 6.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        width: 1.5,
                        color: AppColors.gray.withOpacity(0.3)
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCity,
                      borderRadius: BorderRadius.circular(10.r),
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      hint: Text(
                        'اختر الوجهة',
                        style: TextStyle(
                          color: AppColors.lightGray,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      icon: const Icon(Icons.arrow_drop_down_rounded),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                        color: AppColors.lightGray,
                        fontSize: 12.sp,
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                      ),
                      alignment: Alignment.centerRight,
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                      items: cities.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          alignment: Alignment.centerRight,
                          child: Text(
                              value,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: Colors.black87
                          ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                const HeaderText('الاٍهتمامات'),
                SizedBox(
                  height: 6.h,
                ),


                GridView.count(
                    crossAxisCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                      interests.length,
                          (index) => InterestsButton(
                              interestsModel: interests[index],
                              function: () {
                                setState(() {
                                  interests[index].isSelected =
                                  !interests[index].isSelected;
                                });
                              }),
                  ),
                ),


                SizedBox(
                  height: 30.h,
                ),


                const HeaderText('تاريخ القدوم'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w,),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: SizedBox(
                      height: 250,
                      // width: 100,
                      child: CalendarDatePicker(
                        initialDate: selectedDate,
                        firstDate:DateTime.now(),
                        lastDate: DateTime.utc(2030, 2, 14),
                        onDateChanged: (day){

                        },
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.h,
                ),
                CustomButton(
                    text: 'التالي',
                    function: (){
                      navigateTo(context, ProfileScreen());
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText(
    this.text, {
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Color(0xFF242424),
        fontSize: 18.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        height: 1,
      ),
    );
  }
}


class InterestsModel {
  String text;
  String iconPath;
  bool isSelected;

  InterestsModel(
      {required this.text, required this.iconPath, this.isSelected = false});
}
