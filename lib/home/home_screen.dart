import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamy_app/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islamy_app/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamy_app/home/tabs/radio_tab/radio_tab.dart';
import 'package:islamy_app/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islamy_app/home/tabs/settings_tab/settings_tab.dart';
import 'package:islamy_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = "home";

   homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int index=0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingsProvider>(context);
    return Container(

      decoration: BoxDecoration(
        color: Colors.transparent,

        image: DecorationImage(
            image:provider.isDarkMode()? AssetImage("assets/images/background_dark.png")
                :AssetImage("assets/images/background.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        //  backgroundColor: Colors.transparent,
          appBar: AppBar(
           // backgroundColor: Colors.transparent,
          //  elevation: 0,
          //  centerTitle: true,

            title: Text(
              "إسلامي",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,

              onTap: (value){
                index=value;
                setState(() {

                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_quran.png"))
                  ,label:"القرآن",),

                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/ic_sebha.png"))
                  ,label:"التسبيح",),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage("assets/images/ic_ahadeth.png"))
                  ,label:"الأحاديث",),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/ic_radio.png"))
                  ,label: "الراديو",),
                BottomNavigationBarItem(icon: Icon(Icons.settings),label: "الاعدادات"),
              ]),
         body: Tabs[index],

      ),


    );

  }
List <Widget>Tabs =[
  quranTab(),
  sebhaTab(),
  ahadethTab(),
  radioTab(),
  settingsTab(),

  ];
}
