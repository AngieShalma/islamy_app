
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:islamy_app/models/sura_model.dart';
import 'package:islamy_app/provider/settings_provider.dart';
import 'package:islamy_app/sura_details/sura_details_provider.dart';
import 'package:provider/provider.dart';


class suraDetails extends StatelessWidget {
  static const String routeName = "suraDetails";

  suraDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingsProvider>(context);

    SuraModel model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    // if (verses.isEmpty) {
    //   loadFile(model.index);
    // }
    return ChangeNotifierProvider<SuraDetailsProvider>(create:
        (context)=>SuraDetailsProvider()..loadFile(model.index),
    builder: (context,child){
      var suraDetailsProvider=Provider.of<SuraDetailsProvider>(context);

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

            // iconTheme: Theme.of(context).iconTheme,
            title: Text(
                model.name,
                style:Theme.of(context).textTheme.titleLarge
            ),
          ),
          body: Card(

            // elevation:0.8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            margin: EdgeInsets.only(left: 20.w,right: 20,bottom: 30.h,top: 15),
            color:provider.isDarkMode()?MyTheme.primaryDark.withOpacity(0.8):
            Color(0xffF8F8F8).withOpacity(0.8),
            child: ListView.builder(
                itemCount: suraDetailsProvider.verses.length,
                itemBuilder: (context, index) {
                  return Text(suraDetailsProvider.verses[index],textAlign: TextAlign.center,style: Theme.of(context).textTheme.labelSmall,);
                }),
          ),
        ),
      );
    },);
  }
}
