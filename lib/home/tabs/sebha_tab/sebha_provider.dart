import 'package:flutter/material.dart';

class SebhaProvider extends ChangeNotifier{
  int count=30;

  int index=0;

  void changeCounter(){

    if(count<=30&&count>0){
      count--;
    }
    else if(count==0&&index<3){
      index++;
      count=30;
    }
    else if(count==0&&index>=3){
      index=0;
      count=30;

    }
  notifyListeners();
  }

  List <String> sebhaList=[
    "سبحان الله",
    "الله اكبر",
    "الحمدلله",
    "لا حول ولا قوه الا الله"];
}