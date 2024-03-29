

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel/constants/navigation_method.dart';
import 'package:travel/screens/profile_details_screen.dart';

import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  List<UserModel> users= [
    UserModel(
        name: 'خالد عبدالله', age: '35 - 45',
        interests: 'رياضة - سياحة', city: 'الرياض',
        rate: 3.5, image: 'assets/images/man1.jpeg',
        backgroundImage: 'assets/images/back1.jpg',
        language: 'اسباني - عربي', location: 'عام - خاص',
      email: 'mohamednasser12315@gmail.com',
      phone: '+966547854125', price: '500',
        nationality: 'السعودية', events: '', other: ''
    ),
    UserModel(
        name: 'محمد ناصر', age: '20 - 25',
        interests: 'تجربة استثمارية', city: 'جدة',
        rate: 2, image: 'assets/images/man2.jpg',
        backgroundImage: 'assets/images/back2.jpg',
        language: 'عربي - إنجليزي', location: 'عام',
        email: 'ahhmedbnsayed@gmail.com',
        phone: '+966478965832', price: '350',
        nationality: 'السعودية', events: '', other: ''
    ),
    UserModel(
        name: 'فهد سعود', age: '30 - 35',
        interests: 'تاريخ - ثقافات', city: 'مكة',
        rate: 4.5, image: 'assets/images/man3.jpg',
        backgroundImage: 'assets/images/back3.jpg',
        language: 'فرنسي - عربي', location: 'خاص',
        email: 'mohamedshokier45875@gmail.com',
        phone: '+966456983216', price: '820',
        nationality: 'السعودية', events: '', other: ''
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.0.h, horizontal: 26.w),
            child: ListView.separated(
                itemBuilder: (context, index)=> UserCard(userModel: users[index]),
                separatorBuilder: (context, index)=> SizedBox(height: 35.h,),
                itemCount: 3
            ),
          ),
        ),
      ),
    );
  }
}


class ProfileDataRow extends StatelessWidget {
  const ProfileDataRow({Key? key, required this.title, required this.value}) : super(key: key);
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
              color:Colors.black,
              fontSize:13.sp,
              fontWeight:FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
              color:Colors.grey[600],
              fontSize:12.sp,
              fontWeight:FontWeight.w600,
            ),
          ),
        ),
      ],);
  }
}


class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, ProfileDetailsScreen(userModel: userModel,));
      },
      child: Container(
          height: 160.w,
          width: double.infinity,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              color: AppColors.lighterGray.withOpacity(0.5),
              border: Border.all(color: AppColors.yellowColor, width: 1),
              borderRadius: BorderRadius.circular(12.r)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileDataRow(title: 'الاسم', value: userModel.name,),
                    ProfileDataRow(title: 'العمر', value: userModel.age,),
                    ProfileDataRow(title: 'اهتمامات', value: userModel.interests,),
                    ProfileDataRow(title: 'المدينة', value: userModel.city,),
                    ProfileDataRow(title: 'اللغة', value: userModel.language,),
                    ProfileDataRow(title: 'السكن', value: userModel.location,),
                  ],
                ),
              ),

              Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage(userModel.image),
                  ),
                  SizedBox(height: 14.h,),
                  RatingBar.builder(
                    initialRating: userModel.rate,
                    itemSize: 18.sp,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
                    itemCount: 5,
                    itemBuilder: (context, _) =>const Icon(Icons.star, color: Colors.amber, size: 10,),
                    onRatingUpdate: (rating) {

                    },
                  ),
                ],
              ),
              // Container(
              //     height: 80.w,
              //     width: 80.w,
              //     padding: EdgeInsets.all(10.w),
              //     clipBehavior: Clip.antiAliasWithSaveLayer,
              //     decoration: BoxDecoration(
              //         color: AppColors.lighterGray,
              //         shape: BoxShape.circle,
              //         border: Border.all(color: AppColors.yellowColor, width: 1),
              //         // borderRadius: BorderRadius.circular(12.r)
              //     ),
              //
              //     child: Image.asset('assets/images/man1.jpeg', fit: BoxFit.cover,)
              // )
            ],
          )
      ),
    );
  }
}



class UserModel{
  String name;
  String age;
  String interests;
  String city;
  String language;
  String location;
  double rate;
  String image;
  String backgroundImage;
  String phone;
  String email;
  String nationality;
  String events;
  String other;
  String price;

  UserModel({
    required this.name,
    required this.age,
    required this.interests,
    required this.city,
    required this.rate,
    required this.image,
    required this.language,
    required this.location,
    required this.backgroundImage,
    required this.email,
    required this.phone,
    required this.price,
    required this.events,
    required this.nationality,
    required this.other,
});

}