import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../constants_pilotages/controllers_pilotage.dart';
import '../../../../models_pilotage/indicateur_pilotage_model.dart';
import 'enjeu_widget.dart';
import 'indicateur_widgets.dart';

class DashBoardTwo extends StatefulWidget {
  final String idPilier;
  final String title;
  final Color color;
  final Map dropDownState;
  const DashBoardTwo({Key? key, required this.title, required this.color, required this.dropDownState, required this.idPilier}) : super(key: key);

  @override
  State<DashBoardTwo> createState() => _DashBoardTwoState();
}

class _DashBoardTwoState extends State<DashBoardTwo> {

  var listIconData = {
    "pilier0":Icons.camera_outlined, "pilier1":Icons.manage_accounts, "pilier2":Icons.money,
    "pilier3":Iconsax.people, "pilier4":Iconsax.tree,
  };

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color:Colors.white,
                border: Border.all(color: widget.color,width: 2.0),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 4,bottom: 4,right: 14,left: 20),
                child: Row(
                  children: [
                    Icon(listIconData[widget.idPilier],color: widget.color,size: 24,),
                    SizedBox(width: 20,),
                    Text(widget.title,style: TextStyle(color: widget.color,fontSize: 16,fontWeight: FontWeight.bold),),
                    Expanded(child: Container()),
                    RotatedBox(
                      quarterTurns: widget.dropDownState["value"] ? 1:3,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_sharp,color: Colors.black,),
                        onPressed: (){
                          if (widget.dropDownState["value"]){
                            pDashBoardController.changeStatePilier(widget.idPilier, false);
                          }else {
                            pDashBoardController.changeStatePilier(widget.idPilier, true);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.dropDownState["value"],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: getPilierSubWidget(widget.idPilier)
              ),
            )
          ],
        )
    );
  }

  List<Widget> getPilierSubWidget(String idPilier ){
    switch(idPilier){
      case "pilier0" :
        return getIndicateurWidgetGeneral();
      case "pilier1" :
        return [
          SizedBox(height: 1,),
          EnjeuWidget(numero:"1a",idPilier: widget.idPilier,idEnjeu: "enjeu1a",enjeuTitle: "Gouvernance DD et strat??gie",dropDownState: widget.dropDownState,color: widget.color,),
          SizedBox(height: 1,),
          EnjeuWidget(numero:"1b",idPilier: widget.idPilier,idEnjeu: "enjeu1b",enjeuTitle: "Pilotage DD",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
          EnjeuWidget(numero:"2",idPilier: widget.idPilier,idEnjeu: "enjeu2",enjeuTitle: "??thique des affaires et achats responsables",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
          EnjeuWidget(numero:"3",idPilier: widget.idPilier,idEnjeu: "enjeu3",enjeuTitle: "Int??gration des attentes DD des clients et consommateurs",dropDownState: widget.dropDownState,color: widget.color,),
          SizedBox(height: 1,),
        ];
      case "pilier2" :
        return [
          SizedBox(height: 1,),
          EnjeuWidget(numero:"4",idPilier: widget.idPilier,idEnjeu: "enjeu4",enjeuTitle: "??galit?? de traitement",dropDownState: widget.dropDownState,color: widget.color,),
          SizedBox(height: 1,),
          EnjeuWidget(numero:"5",idPilier: widget.idPilier,idEnjeu: "enjeu5",enjeuTitle: "Conditions de travail",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
          EnjeuWidget(numero:"6",idPilier: widget.idPilier,idEnjeu: "enjeu6",enjeuTitle: "Am??lioration du cadre de vie",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
        ];
      case "pilier3" :
        return [
          SizedBox(height: 1,),
          EnjeuWidget(numero:"7",idPilier: widget.idPilier,idEnjeu: "enjeu7",enjeuTitle: "Inclusion sociale et d??veloppement des communaut??s",dropDownState: widget.dropDownState,color: widget.color,),
          SizedBox(height: 1,),
        ];
      case "pilier4" :
        return [
          SizedBox(height: 1,),
          EnjeuWidget(numero:"8",idPilier: widget.idPilier,idEnjeu: "enjeu8",enjeuTitle: "Changement climatique et d??forestation",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
          EnjeuWidget(numero:"9",idPilier: widget.idPilier,idEnjeu: "enjeu9",enjeuTitle: "Gestion et traitement de l???eau",dropDownState: widget.dropDownState,color: widget.color),
          SizedBox(height: 1,),
          EnjeuWidget(numero:"10",idPilier: widget.idPilier,idEnjeu: "enjeu10",enjeuTitle: "Gestion des ressources et d??chets",dropDownState: widget.dropDownState,color: widget.color,),
          SizedBox(height: 1,),
        ];
      default:
        return [
          Text("default"),
        ];
    }
  }


  List<Widget> getIndicateurWidgetGeneral(){
    List<IndicateurModel> listIndicateurs = pTableauController.indicateurs.where(
            (indicateur) => indicateur.enjeu == "enjeu0"
    ).toList();

    return listIndicateurs.map(
            (indicateur){
          return IndicateurWidget(indicateur: indicateur);
        }
    ).toList();
  }

}
