import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../constants/colors.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/menu_deroulant.dart';
import '../../../../../widgets/unimpleted_widget.dart';


class EnteteMonitoring extends StatefulWidget {
  const EnteteMonitoring({Key? key}) : super(key: key);

  @override
  State<EnteteMonitoring> createState() => _EntityWidgetWidgetState();
}

class _EntityWidgetWidgetState extends State<EnteteMonitoring> {

  List<String> convertToListString(List<int> data){
    return data.map((e) => e.toString()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.show_chart,size: 20,),
            const SizedBox(width: 5,),
            const CustomText(text: "Performances",weight: FontWeight.bold,size: 20,),
            Image.asset("assets/logos/logo_sifca.png",height: 40,width : 72,fit: BoxFit.fitWidth,),
            const SizedBox(width: 20,),
            const CustomText(text: "Entité",size: 20,),
            const SizedBox(width: 5,),
            MenuDeroulant(
              indication: "",
              items: ["Sania"],
              width: 200,
              initValue: "Sania",
              onChanged: (value) async{

              },
            ),
            const SizedBox(width: 10,),
            const CustomText(text: "Année",size: 20,),
            const SizedBox(width: 5,),
            MenuDeroulant(
              indication: "",
              initValue: "2022",
              items:  ["2022","2023"],
              width: 100,
              onChanged: (value) async{
              },
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () async{
                  },
                  icon: Icon(Iconsax.refresh,color: Color(0xFF4F80B5),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () {
                    UnimplementedWidget.showDialog();
                  },
                  icon: const Icon(Iconsax.printer,color: Colors.white,),
                  label: const CustomText(text: "Imprimer", color: light, size: 15,)),
            )
          ],
        ),
      );
  }
}