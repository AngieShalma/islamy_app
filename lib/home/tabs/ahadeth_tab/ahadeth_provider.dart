import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/ahadeth_model.dart';

class AhadethProvider extends ChangeNotifier{

  List <HadethModel>ahadethData=[];

  loadHadethFile(){
    rootBundle.loadString("assets/files/ahadeth.txt").then((hadthFile) {
      List <String> ahadeth=hadthFile.split("#");
      for(int i=0;i<ahadeth.length;i++){
        String ahadethOne=ahadeth[i];
        List<String> ahadethLines=ahadethOne.trim().split("\n");
        String title=ahadethLines[0];
        ahadethLines.removeAt(0);
        List <String> ahadethContent=ahadethLines;
        ahadethData.add(HadethModel(title: title, ahadethContent: ahadethContent));
        notifyListeners();
      }

    });

  }


}