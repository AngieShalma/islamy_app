import 'package:flutter/material.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{
String appLanguage="ar";
ThemeMode appTheme=ThemeMode.light;
 Future<void>setItems()async{
   sharedPreferences=await SharedPreferences.getInstance();
   if(getTheme()??false){
     appTheme=ThemeMode.dark;
   }else{
     appTheme=ThemeMode.light;

   }
   if(getLang()??false){
     appLanguage="ar";
   }else{
     appLanguage="en";

   }
 }

SharedPreferences? sharedPreferences;
changeAppLanguage(newLanguage)
{
  if(newLanguage==appLanguage){
    saveLang(true);
  return;}
  else{
    appLanguage=newLanguage;
    saveLang(false);

    notifyListeners();
  }

}

changeAppTheme(newTheme)
{
  if(newTheme==appTheme){
    saveTheme(false);
    return;}
  else{
    appTheme=newTheme;
    saveTheme(true);
    notifyListeners();
  }

}

bool isDarkMode()
{
 return appTheme==ThemeMode.dark;

}
Future<void> saveTheme(bool isDark)async{
  await sharedPreferences!.setBool("isDark", isDark);
}
Future<void> saveLang(bool isArabic)async{
  await sharedPreferences!.setBool("isArabic", isArabic);
}
bool? getTheme(){
  return sharedPreferences!.getBool("isDark");

}
bool? getLang(){
  return sharedPreferences!.getBool("isArabic");

}
}
