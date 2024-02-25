
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy_app/ahadeth_details.dart';
import 'package:islamy_app/home/home_screen.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:islamy_app/provider/settings_provider.dart';
import 'package:islamy_app/sura_details/sura_details.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SettingsProvider settingsProvider=SettingsProvider();
  await settingsProvider.setItems();
  runApp(ChangeNotifierProvider(
      create: (context)=>settingsProvider,
      child: MyApp()));
  //convertListToMap();
}
class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingsProvider>(context);
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context , child) {
        return MaterialApp(
          theme: MyTheme.lightMode,
          darkTheme:MyTheme.darkMode ,
          themeMode: provider.appTheme,
          locale: Locale(provider.appLanguage),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          debugShowCheckedModeBanner: false,
          initialRoute:homeScreen.routeName,
          routes: {
            homeScreen.routeName:(context)=>homeScreen(),
           suraDetails.routeName:(context) =>suraDetails(),
           ahadethDetails.routeName:(context)=>ahadethDetails(),
          },

        );
      },

    );
  }
}
