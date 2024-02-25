import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:islamy_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';
class languageBottomSheet extends StatelessWidget{
   languageBottomSheet({Key? key}) : super(key: key);
   Widget selectedItem(context,text){
     var provider=Provider.of<SettingsProvider>(context,listen: false);

     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text(text,
           style:provider.isDarkMode()? Theme.of(context).textTheme.titleMedium?.copyWith(
               color: MyTheme.primaryLight,
             fontWeight: FontWeight.bold
           ): Theme.of(context).textTheme.titleMedium?.copyWith(
               color: MyTheme.primaryDark,
               fontWeight: FontWeight.bold
           ),),
         Icon(Icons.check,color:provider.isDarkMode()?MyTheme.primaryLight
             :MyTheme.primaryDark),
       ],
     );
   }
   Widget unSelectedItem(context,text){
     return  Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,

       children: [
         Text(text,
           style: Theme.of(context).textTheme.titleMedium,),

         // Icon(Icons.check),

       ],
     );
   }
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingsProvider>(context);

    return Container(
      decoration: BoxDecoration(
       // borderRadius: BorderRadius.circular(15 )
            color: provider.isDarkMode()?MyTheme.primaryDark:MyTheme.primaryLight
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeAppLanguage("en");
            },
            child:provider.appLanguage=="en"?selectedItem(context,
                AppLocalizations.of(context)!.english):
            unSelectedItem(context, AppLocalizations.of(context)!.english) ,
          ),
          SizedBox(height: 10.h,),
          InkWell(
            onTap: (){
              provider.changeAppLanguage("ar");
            },
            child:provider.appLanguage=="ar"?selectedItem(context,
                AppLocalizations.of(context)!.arabic):
            unSelectedItem(context, AppLocalizations.of(context)!.arabic) ,
          ),],
      ),
    );
  }
}
