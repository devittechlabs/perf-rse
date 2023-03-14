import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:perfrse/core/api_client.dart';
import 'package:perfrse/pilotage/constants_pilotages/controllers_pilotage.dart';
import 'package:perfrse/pilotage/models_pilotage/indicateur_pilotage_model.dart';

import '../../../../../constants/main_controllers.dart';

class DashBoardUtils{

  static bool editDataRow(IndicateurModel indicator,num? value,String mois){
    Get.defaultDialog(
        title: "Mettre à jour l'indicateur",
        //textAlign: TextAlign.start,
        radius: 10,
        middleTextStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
        contentPadding: const EdgeInsets.all(30),
        titlePadding: const EdgeInsets.only(top: 20,right: 20,left: 20),
        titleStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),
        content: ContentEdition(indicator: indicator,value: value,mois:mois),
    );
    return true;
  }
}


class ContentEdition extends StatefulWidget {
  final IndicateurModel indicator;
  final num? value;
  final String mois;
  const ContentEdition({Key? key, this.value, required this.indicator, required this.mois}) : super(key: key);

  @override
  State<ContentEdition> createState() => _ContentEditionState();
}

class _ContentEditionState extends State<ContentEdition> {

  final _keyForm  = GlobalKey<FormState>();
  final TextEditingController valueController = TextEditingController();
  final ApiClient dioClient = ApiClient();
  late bool onLoading;
  int resultEdition = 0 ;


  @override
  void initState() {
    onLoading = false;
    valueController.text = widget.value !=null ? "${widget.value}" : "";
    resultEdition = 0 ;
    super.initState();
  }

  Widget resultUI(){
    if (onLoading == true){
      return const Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Center(child: CircularProgressIndicator(color: Colors.blue,)),
      );
    }else{
      switch (resultEdition){
        case 0 :
          return Container();
        case -1 :
          return Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.dangerous,color: Colors.red,),
                SizedBox(width: 20,),
                Text("Echec lor de l'édition")
              ],
            ),
          );
        case 1 :
          return  Container();
        default :
          return Container();
      };
    }
  }


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          child: Text("${widget.indicator.intitule} (${widget.indicator.unite})",
            style: const TextStyle(fontSize: 15,fontStyle: FontStyle.italic),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        const SizedBox(height: 20,),
        Form(
          key: _keyForm,
          child: TextFormField(
            controller: valueController,
            validator: (val) => GetUtils.isNum("$val")  ? null : "Erreur de saisie",
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        resultUI(),
        const SizedBox(height: 8.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: const Text('Annuler'),
              onPressed: () => Navigator.of(Get.context!).pop(),
            ),
            ElevatedButton(
              child: const Text('Valider'),
              onPressed: onLoading == true ? null : () async {
                if ( _keyForm.currentState!.validate() ){
                  setState(() {
                    onLoading = true;
                  });

                  int rowId = widget.indicator.numero!;
                  int moisId = pDashBoardController.getMoisId();
                  String entityId = userController.user.accesPilotage!.entitePrimaire!;
                  int annee = int.parse(pDashBoardController.currentYear.value);

                  bool result = await dioClient.renseignerIndicateur(rowId: rowId-1, moisId: moisId, value: num.parse(valueController.text),entityId:entityId,annee: annee);

                  if (result == false ){
                    setState(() {
                      onLoading = false;
                      resultEdition = -1;
                    });

                  }else {
                    setState(() {
                      onLoading = false;
                      resultEdition = 1;
                    });
                    Navigator.of(Get.context!).pop();
                    bool resultUpdate = await pTableauController.onAppLoadingEntityData(entityId);
                    if (resultUpdate == true){
                      ScaffoldMessenger.of(Get.context!).showSnackBar(
                        const SnackBar(content: Text("La donné a bien été renseigné"),duration: Duration(seconds: 2),backgroundColor: Colors.green,),
                      );
                    }else{
                      ScaffoldMessenger.of(Get.context!).showSnackBar(
                        const SnackBar(content: Text("Échec veuillez vérifier votre connexion internet"),duration: Duration(seconds: 2),backgroundColor: Colors.red,),
                      );
                    }
                  }
                }
              },
            )
          ],
        )
      ],
    );
  }

  String getIdDoc(String idIndicateur,String entityAbr,String annee){
    final id = "${entityAbr}_${annee}_${idIndicateur}";
    return id;
  }
}

