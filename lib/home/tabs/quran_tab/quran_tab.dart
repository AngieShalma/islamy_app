import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamy_app/my_theme.dart';
import 'package:islamy_app/home/tabs/quran_tab/quran_provider.dart';
import 'package:islamy_app/sura_details/sura_details.dart';
import 'package:islamy_app/models/sura_model.dart';
import 'package:provider/provider.dart';

import '../../../provider/settings_provider.dart';

class quranTab extends StatefulWidget {
   quranTab({Key? key}) : super(key: key);
  @override
  State<quranTab> createState() => _quranTabState();
}

class _quranTabState extends State<quranTab> {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<SettingsProvider>(context);

    return ChangeNotifierProvider<QuranProvider>(
        create: (context)=>QuranProvider()..convertListToMap(),
    builder: ((context, child) {
      var quranProvider=Provider.of<QuranProvider>(context);
      return  Column(
        children: [
          Center(child: Image.asset("assets/images/quran_logo.png")),

          Container(
            height: 430.h,
            width: double.infinity,
            child: SingleChildScrollView(
              child: DataTable(

                border: TableBorder.all(

                  width: 3.0.w,
                  color: provider.isDarkMode()?MyTheme.yellowColor:
                  Color(0xffB7935F),
                  style: BorderStyle.solid,

                ),
                // dividerThickness: 5,
                decoration: BoxDecoration(

                  color: Colors.transparent,
                ),
                // showBottomBorder: true,

                //headingRowColor: MaterialStateProperty.all(Colors.amber),
                columns: [
                  DataColumn(label: buildText(context, "عدد الآيات")),
                  DataColumn(label: buildText(context, "اسم السورة")),

                ],

                rows: quranProvider.combinedList.map((item) {
                  return DataRow(cells: [
                    DataCell(Center(
                        child: Text(
                          "${item["number"]}",
                          style: Theme.of(context).textTheme.labelMedium,
                          textDirection: TextDirection.rtl,
                        ))),
                    DataCell(
                      Center(
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, suraDetails.routeName,
                                  arguments: SuraModel(name: item["name"], index:item['index'] ));
                              print(item['index'].runtimeType);
                              setState(() {
                              });
                            },
                            child: Text(
                              item["name"],
                              style: Theme.of(context).textTheme.labelMedium,
                              textDirection: TextDirection.rtl,
                            ),
                          )),
                    )

                    //  DataCell(Text(item['name'])),
                  ]);
                }).toList(),
              ),
            ),
          ),

        ],
      );
    }),);
  }

  Text buildText(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
