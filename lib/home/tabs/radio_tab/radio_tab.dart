import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy_app/my_theme.dart';

class radioTab extends StatelessWidget {
  const radioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio.png"),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 100.w,vertical: 57.h),
          child: Text("إذاعة القرآن الكريم",style: Theme.of(context).textTheme.titleMedium,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){}, icon: Icon(
              Icons.skip_previous_rounded,size: 36.sp,color: MyTheme.primaryLight,)),
            IconButton(onPressed: (){}, icon: Icon(
              Icons.play_arrow_rounded,size: 36.sp,color: MyTheme.primaryLight,)),
            IconButton(onPressed: (){}, icon: Icon(
              Icons.skip_next_rounded,size: 36.sp,color: MyTheme.primaryLight,)),

          ],
        ),



      ],
    );
  }
}
