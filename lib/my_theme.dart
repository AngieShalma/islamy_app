import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{


   static Color blackColor=Color(0xff242424);
   static Color primaryLight=Color(0xffB7935F);
   static Color yellowColor=Color(0xfffacc1d);
   static Color primaryDark =Color(0xff141a2e);

   static ThemeData lightMode =ThemeData(
       bottomNavigationBarTheme:BottomNavigationBarThemeData(
           selectedItemColor: blackColor,
         backgroundColor: Color(0xffB7935F),
       ) ,
     primaryColor: primaryLight,
     appBarTheme: AppBarTheme(
       backgroundColor: Colors.transparent,
       iconTheme: IconThemeData(color: Colors.black,),

       elevation: 0,
       centerTitle: true,
     ),
     scaffoldBackgroundColor: Colors.transparent,
     textTheme: TextTheme(
       titleLarge:  GoogleFonts.elMessiri(
       color: Colors.black,
       fontSize: 30.sp,
       fontWeight: FontWeight.w700),

       titleMedium: GoogleFonts.elMessiri(
         fontSize: 25.sp,
         fontWeight: FontWeight.w600,
       ),
       labelMedium:  GoogleFonts.inter(
       fontSize: 25.sp,
       fontWeight: FontWeight.w400,
     ),
       labelSmall:  GoogleFonts.inter(
   fontSize: 25.sp,
   fontWeight: FontWeight.w400,
     ),)
   );

   static ThemeData darkMode =ThemeData(
   bottomNavigationBarTheme:BottomNavigationBarThemeData(
     selectedItemColor: yellowColor,
     backgroundColor: primaryDark,

   ) ,
       primaryColor: primaryDark,
       appBarTheme: AppBarTheme(
         backgroundColor: Colors.transparent,
         iconTheme: IconThemeData(color: Colors.white,),

         elevation: 0,
         centerTitle: true,
       ),
       scaffoldBackgroundColor: Colors.transparent,
       textTheme: TextTheme(
         titleLarge:  GoogleFonts.elMessiri(
             color: Colors.white ,
             fontSize: 30.sp,
             fontWeight: FontWeight.w700),

         titleMedium: GoogleFonts.elMessiri(
           fontSize: 25.sp,
           color: Colors.white,
           fontWeight: FontWeight.w600,
         ),
         labelMedium:  GoogleFonts.inter(
           fontSize: 25.sp,
           color: Colors.white,
           fontWeight: FontWeight.w400,
         ),
         labelSmall:  GoogleFonts.inter(
           fontSize: 25.sp,
           color: Colors.white,
           fontWeight: FontWeight.w400,
         ),)
   );

}