import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy_app/models/ahadeth_model.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:islamy_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class ahadethDetails extends StatelessWidget {
  static const String routeName="ahadethDetails";
  const ahadethDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingsProvider>(context);

    var model=ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
            image:provider.isDarkMode()? AssetImage("assets/images/background_dark.png")
                :AssetImage("assets/images/background.png"),
            fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        //  backgroundColor: Colors.transparent,
        appBar: AppBar(

          // iconTheme: Theme.of(context).iconTheme,
          title: Text(
              model.title,
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

              itemCount: model.ahadethContent.length,
              itemBuilder: (context, index) {
                return Text(model.ahadethContent[index]
                  ,textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelSmall,);
              }),
        ),
      ),
    );
  }
}
