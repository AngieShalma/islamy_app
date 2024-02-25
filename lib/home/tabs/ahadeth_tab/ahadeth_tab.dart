import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy_app/ahadeth_details.dart';
import 'package:islamy_app/models/ahadeth_model.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:islamy_app/home/tabs/ahadeth_tab/ahadeth_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/settings_provider.dart';

class ahadethTab extends StatefulWidget {
   ahadethTab({Key? key}) : super(key: key);

  @override
  State<ahadethTab> createState() => _ahadethTabState();
}

class _ahadethTabState extends State<ahadethTab> {
 //  List <HadethModel>ahadethData=[];
 //
 // loadHadethFile(){
 //   rootBundle.loadString("assets/files/ahadeth.txt").then((hadthFile) {
 //  List <String> ahadeth=hadthFile.split("#");
 //  for(int i=0;i<ahadeth.length;i++){
 //    String ahadethOne=ahadeth[i];
 //    List<String> ahadethLines=ahadethOne.trim().split("\n");
 //    String title=ahadethLines[0];
 //    ahadethLines.removeAt(0);
 //    List <String> ahadethContent=ahadethLines;
 // ahadethData.add(HadethModel(title: title, ahadethContent: ahadethContent));
 // setState(() {
 //
 // });
 //  }
 //
 //   });
 //
 // }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingsProvider>(context);

    // if(ahadethData.isEmpty){
    //     loadHadethFile();
    //   }
    return ChangeNotifierProvider(
      create: (context)=>AhadethProvider()..loadHadethFile(),
    builder: (context, child) {
      var ahadethProvider=Provider.of<AhadethProvider>(context);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/ahadeth.png")),
          Divider(
            thickness: 3,
            color: provider.isDarkMode()?MyTheme.yellowColor:
            Color(0xffB7935F),        ),
          Text(
            "الأحاديث",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Divider(
            thickness: 3,
            color: provider.isDarkMode()?MyTheme.yellowColor:
            Color(0xffB7935F),        ),
          Container(
            height: 360.h,

            child: ListView.separated(
                separatorBuilder: (context,index)=>Divider(
                  thickness: 2,
                  color: provider.isDarkMode()?MyTheme.yellowColor:
                  Color(0xffB7935F),),
                itemCount:ahadethProvider.ahadethData.length,
                itemBuilder: (context, index) {
                  return Center(child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, ahadethDetails.routeName,
                            arguments: ahadethProvider.ahadethData[index]);
                      },
                      child: Text(ahadethProvider.ahadethData[index].title,style: Theme.of(context).textTheme.labelMedium,)),);
                }),
          ),
        ],
      );
    });
  }
}
