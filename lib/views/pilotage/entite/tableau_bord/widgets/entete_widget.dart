import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../constants/colors.dart';
import '../../../../../widgets/custom_full_screen_dialog.dart';
import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/menu_deroulant.dart';
import '../../../../../widgets/unimpleted_widget.dart';


class EntityWidget extends StatefulWidget {
  const EntityWidget({Key? key}) : super(key: key);

  @override
  State<EntityWidget> createState() => _EntityWidgetWidgetState();
}

class _EntityWidgetWidgetState extends State<EntityWidget> {

  String? selectedValueYear;
  String? selectedValueMonth;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(text: "Tableau de Bord",weight: FontWeight.bold,size: 20,),
            const SizedBox(width: 10,),
            Image.asset("assets/logos/logo_sifca_bon.png",height: 50,width : 72,fit: BoxFit.fitWidth,),
            const SizedBox(width: 10,),
            const CustomText(text: "Entité",size: 20,),
            const SizedBox(width: 5,),
            MenuDeroulant(
              indication: "",
              items: ["Sucrvoire Siège","Sucrvoire"],
              width: 200,
              initValue: "Sucrvoire Siège",
              onChanged: (value){
              },
            ),
            const SizedBox(width: 10,),
            const CustomText(text: "Année",size: 20,),
            const SizedBox(width: 5,),
            MenuDeroulant(
              indication: "",
              initValue: "2023",
              items: ["2021","2022","2023"],
              width: 100,
              selectedValue: selectedValueYear,
              onChanged2: (value){
                /*setState(() {
                  if (value!=null && int.parse(value)<= 2022){
                    selectedValueYear = value;
                    if (value!=null) pDashBoardController.changeYear(value);
                  }
                });
                pDashBoardController.updateListRealiseAn();*/
              },
            ),
            const SizedBox(width: 10,),
            const CustomText(text: "Mois",size: 20,),
            const SizedBox(width: 5,),
            MenuDeroulant(
                initValue: "Janvier",
                indication: "",
                items: ["Janvier","Février","Mars","Avril"],
                width: 125,
                selectedValue: "Janvier",
                onChanged2: (value){
                },
              ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: () async{
                CustomFullScreenDialog.showDialog();
                await Future.delayed(Duration(seconds: 10));
                //String entityPrimaire = userController.user.accesPilotage!.entitePrimaire!;
                //bool resultUpdate = await pTableauController.onAppLoadingEntityData(entityPrimaire);
                await Future.delayed(const Duration(seconds: 1));
                if (true){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("L'actualisation des données a bien été éffectué"),duration: Duration(seconds: 2),backgroundColor: Colors.green,),
                  );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Échec veuillez vérifier votre connexion internet"),duration: Duration(seconds: 2),backgroundColor: Colors.red,),
                  );
                }
                CustomFullScreenDialog.cancelDialog();
                }, icon: Icon(Iconsax.refresh,color: Color(0xFF4F80B5),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton.icon(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue)),
                  onPressed: () {
                    UnimplementedWidget.showDialog();
                  },
                  icon: const Icon(Iconsax.export,color: Colors.white,),
                  label: const CustomText(
                    text: "Exporter",
                    color: light,
                    size: 15,
                  )),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(width: 3.0),
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                ),
                child: CustomText(
                  text: "Administrateur",
                  size: 13,
                  color: Colors.green,
                ))
          ],
        ),
      );
  }
  /*String getAccesPilote(AccesPilotageModel? accesPilotageModel){
    if (accesPilotageModel == null ) return "";
    if (accesPilotageModel.estAdmin == true) {
      return "Administrateur";
    }else {
      String collecteur = (accesPilotageModel.estCollecteur!=null && accesPilotageModel.estCollecteur==true) ? "Collecteur - ":"";
      String validateur = (accesPilotageModel.estValidateur!=null && accesPilotageModel.estValidateur==true) ? "Validateur":"";
      String accesPilotage = "${collecteur}${validateur}" == "" ? "Spectacteur" : "${collecteur}${validateur}";
      return accesPilotage;
    }
  }*/
}




