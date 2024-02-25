import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:islamy_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';
class themeBottomSheet extends StatelessWidget{
  themeBottomSheet({Key? key}) : super(key: key);
  Widget selectedItem(context,text){
    var provider=Provider.of<SettingsProvider>(context,listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style:provider.isDarkMode()? Theme.of(context).textTheme.titleMedium?.copyWith(
              color: MyTheme.yellowColor,
              fontWeight: FontWeight.bold
          ):Theme.of(context).textTheme.titleMedium?.copyWith(
              color: MyTheme.blackColor,
              fontWeight: FontWeight.bold
          ),),
        Icon(Icons.check,color:
        provider.isDarkMode()? MyTheme.primaryLight: MyTheme.blackColor,),
      ],
    );
  }
  Widget unSelectedItem(context,text){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white
          ),),

        // Icon(Icons.check),

      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingsProvider>(context);

    return Container(
      decoration: BoxDecoration(
        //  borderRadius: BorderRadius.circular(15 ),
              color: provider.isDarkMode()?MyTheme.primaryDark:MyTheme.primaryLight
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeAppTheme(ThemeMode.dark);
            },
            child:    provider.isDarkMode()?selectedItem(context,
                AppLocalizations.of(context)!.dark):
            unSelectedItem(context, AppLocalizations.of(context)!.dark) ,
          ),
          SizedBox(height: 10.h,),
          InkWell(
            onTap: (){
              provider.changeAppTheme(ThemeMode.light);
            },
            child:!provider.isDarkMode()?selectedItem(context,
                AppLocalizations.of(context)!.light):
            unSelectedItem(context, AppLocalizations.of(context)!.light) ,
          ),],
      ),
    );
  }
}