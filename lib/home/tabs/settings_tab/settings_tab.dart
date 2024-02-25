import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy_app/home/tabs/settings_tab/language_bottm_sheet.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:islamy_app/home/tabs/settings_tab/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../../provider/settings_provider.dart';

class settingsTab extends StatelessWidget {
  const settingsTab({Key? key}) : super(key: key);
showLanguageBottomSheet(context){
  showModalBottomSheet(context: context,
      builder: ((context) => languageBottomSheet()));
}
  showThemeBottomSheet(context){
    showModalBottomSheet(context: context,
        builder: ((context) => themeBottomSheet()));
  }
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.titleLarge,),
          InkWell(
            onTap: (){
              return showLanguageBottomSheet(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                border: Border.all(width: 3,
                    color:provider.isDarkMode()?MyTheme.yellowColor :MyTheme.primaryLight)
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( provider.appLanguage=="en"?
                  AppLocalizations.of(context)!.english:
                  AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.titleMedium,),
                  Icon(Icons.arrow_drop_down_sharp,size: 35.sp,)
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.titleLarge,),
          InkWell(
            onTap: (){
              return showThemeBottomSheet(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(width: 3,
                      color:provider.isDarkMode()?MyTheme.yellowColor :MyTheme.primaryLight)
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text( provider.appTheme==ThemeMode.light?
                  AppLocalizations.of(context)!.light:
                  AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.titleMedium,),
                  Icon(Icons.arrow_drop_down_sharp,size: 35.sp,)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
