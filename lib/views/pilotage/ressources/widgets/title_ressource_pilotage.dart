import 'package:flutter/material.dart';
import 'package:perf_rse/constants/colors.dart';
import 'package:perf_rse/widgets/custom_text.dart';

class TitleRessourcePilotage extends StatefulWidget {
  const TitleRessourcePilotage({Key? key}) : super(key: key);

  @override
  State<TitleRessourcePilotage> createState() => _TitleRessourcePilotageState();
}

class _TitleRessourcePilotageState extends State<TitleRessourcePilotage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            "assets/logos/logo_sifca_bon.png",
            scale: 4,
          ),
          Column(
            children: [
              CustomText(text: "Arborescence de collecte et de  Consolidation ",
                size: 30,color: Colors.black,weight: FontWeight.bold,),
              CustomText(text: "des données RSE/DD",
                size: 30,color: Colors.black,weight: FontWeight.bold,),
            ],
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: headerApp,width: 2.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: headerApp,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(
                    child: CustomText(
                      text: "Autres Ressources",
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.telegram,color: Colors.green,),
                    label: Text("Stratégie",style: TextStyle(color: activeBlue))
                ),
                TextButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.person,color: Colors.orange,),
                    label: Text("Contributeurs",style: TextStyle(color: activeBlue))
                ),
                TextButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.batch_prediction,color: Colors.brown,),
                    label: Text("Politique RSE",style: TextStyle(color: activeBlue),)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
