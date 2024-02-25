import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:islamy_app/home/tabs/sebha_tab/sebha_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/settings_provider.dart';

class sebhaTab extends StatefulWidget {
   sebhaTab({Key? key}) : super(key: key);

  @override
  State<sebhaTab> createState() => _sebhaTabState();
}

class _sebhaTabState extends State<sebhaTab> {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingsProvider>(context);

    return ChangeNotifierProvider<SebhaProvider>(
      create: (context)=>SebhaProvider(),
    builder:(context,child){
      var sebhaProvider=Provider.of<SebhaProvider>(context);

      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 30.w),
                  child: provider.isDarkMode()?
                  Image.asset("assets/images/head_of_sebha_dark.png",)
                      :Image.asset("assets/images/head_of_sebha.png",),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 85.h),
                  child: InkWell(
                    onTap: (){
                    sebhaProvider.changeCounter();
                    },
                    child:  provider.isDarkMode()?
                    Image.asset("assets/images/sebha_dark.png",)
                        :Image.asset("assets/images/body_of_sebha.png",),),
                )

              ],
            ),
            Padding(
              padding:  EdgeInsets.only(bottom: 22.h,top: 43.h),
              child: Text("عدد التسبيحات",style: Theme.of(context).textTheme.titleMedium,),
            ),
            Container(
              height: 81.h,
              width: 69.w,
              decoration: BoxDecoration(
                color:provider.isDarkMode()?MyTheme.primaryDark.withOpacity(0.8):
                MyTheme.primaryLight.withOpacity(0.57),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "${sebhaProvider.count}",
                  style: provider.isDarkMode()?
                  Theme.of(context).textTheme.labelMedium:
                  Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            SizedBox(height: 22.h,),
            Container(
              height: 51.h,
              width: 137.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color:provider.isDarkMode()?MyTheme.primaryDark:
                MyTheme.primaryLight,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
               sebhaProvider.sebhaList[sebhaProvider.index],
                style:provider.isDarkMode()?
                Theme.of(context).textTheme.labelMedium:
                Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
      );
    } ,);
  }
}
