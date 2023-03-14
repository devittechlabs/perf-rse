import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:perfrse/pilotage/models_pilotage/indicateur_pilotage_model.dart';
import '../../../../../constants/main_controllers.dart';
import '../../../../../core/api_client.dart';
import '../../../../../helpers/helper_methods.dart';
import '../../../../constants_pilotages/controllers_pilotage.dart';
import 'dashboard_utils.dart';

class IndicateurWidget extends StatefulWidget {
  final IndicateurModel indicateur;
  const IndicateurWidget({Key? key, required this.indicateur})
      : super(key: key);

  @override
  State<IndicateurWidget> createState() => _IndicateurWidgetState();
}

class _IndicateurWidgetState extends State<IndicateurWidget> {
  final ApiClient dioClient = ApiClient();
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHovering = value;
        });
      },
      child: Material(
        elevation: isHovering ? 10 : 0,
        child: Container(
          padding: EdgeInsets.only(left: 2.0),
          decoration: BoxDecoration(
            border: isHovering ? Border.all(color: Colors.black, width: 1.0) : null,
            color: widget.indicateur.type != "Primaire" ? Color(0xFFFDDDCC) : Colors.transparent,
          ),
          height: 40,
          child: Row(
            children: [
              // Réf
              Container(
                height: 40,
                width: 120,
                alignment: Alignment.centerLeft,
                color: Colors.transparent,
                child: Row(
                  children: [
                    if (isHovering)
                      Icon(
                        Icons.mouse,
                        size: 12,
                      ),
                    if (isHovering)
                      SizedBox(
                        width: 2,
                      ),
                    Text(
                      "#${widget.indicateur.numero} ${widget.indicateur.reference}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              // Intitule
              Container(
                height: 40,
                width: 420,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.indicateur.intitule}",
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              // Processus
              Container(
                height: 40,
                width: 170,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: Text("${widget.indicateur.processus}",
                    style: TextStyle(fontStyle: FontStyle.italic,fontSize: 12)),
              ),
              // Réalise Annuel
              Container(
                  height: 40,
                  width: 150,
                  color: Colors.transparent,
                  alignment: Alignment.centerLeft,
                  child: buildRealiseAnColumn()),
              // Réalise Mois
              Container(
                height: 40,
                width: 170,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: buildRealiseMoisColumn(),
              ),
              Container(
                height: 40,
                width: 100,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: const Text("XXXX",
                    style: TextStyle(color: Colors.blueAccent)),
              ),
              Container(
                height: 40,
                width: 90,
                color: Colors.transparent,
                alignment: Alignment.centerLeft,
                child: const Text("+XX %", style: TextStyle(color: Colors.green)),
              ),
              const SizedBox(width: 10,),
              const Center(child: Icon(Icons.more_vert_sharp))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRealiseAnColumn() {
    return Obx(() {
      final dataValue = pDashBoardController.realiseAnValues.value[widget.indicateur.numero! - 1];
      return Row(
        children: [
          Container(
            height: 40,
            width: 110,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  "${dataValue != null ? "${dataValue} " : " -- "}",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "(${widget.indicateur.unite!})",
                  style: TextStyle(fontStyle: FontStyle.italic,fontSize: 12),
                )
              ],
            ),
          ),
          Checkbox(value: false, onChanged: (value) {}),
          SizedBox(width: 3,),
          Container(height: 35,color: Colors.grey,width: 2,)
        ],
      );
    });
  }

  Widget buildRealiseMoisColumn() {
    List<Icon> icons = [
      const Icon(
        Icons.verified,
        color: Colors.green,
      ),
      const Icon(
        Icons.circle,
        color: Colors.yellow,
      ),
      const Icon(
        Icons.circle,
        color: Colors.red,
      ),
    ];

    return Obx(() {
      final num? dataValue = pDashBoardController.realiseDuMoisValues.value[widget.indicateur.numero! - 1];
      final bool? dataValidation = pDashBoardController.valideDuMoisValues.value[widget.indicateur.numero! - 1];
      final estConsolide = pTableauController.entityModel.estConsolide;

      return Row(
        children: [
          Container(width: 64,height: 40,alignment: Alignment.center,child: Text("${dataValue ?? " -- "}")),
          Container(width: 32,height: 40,alignment: Alignment.centerLeft,
            child: (widget.indicateur.type! == "Primaire" && dataValidation != true && estConsolide == false) ? IconButton(splashRadius: 20,splashColor: Colors.amber,
            onPressed: () {
              bool estCollecteur = userController.user.accesPilotage?.estCollecteur ?? false;
              if (estCollecteur) {
                renseignerLaDonnee(widget.indicateur, dataValue, pDashBoardController.getMonthQuery());
              } else {
                showAlert("Vous n'avez pas l'accés collecteur de données", Icon(Icons.warning, color: Colors.red, size: 25,));
              }
              },icon: const Icon(Icons.edit, size: 12,)):null
          ),
          Container(width: 32,height: 40,alignment: Alignment.centerLeft,
            child: dataValidation != true ? Padding(padding: const EdgeInsets.only(right: 2.0, left: 2.0),
              child: Checkbox(checkColor: Colors.white, fillColor: dataValidation == true ? MaterialStateProperty.all(Colors.green) : null,
                value: dataValidation ?? false,
                onChanged: dataValue != null ? (value) async {
                  bool estValidateur = userController.user.accesPilotage?.estValidateur ?? false;
                  if (estValidateur) {
                    validateDataIndicator(value, widget.indicateur.numero!);
                  } else {
                    showAlert("Vous n'etes validateur", Icon(Icons.warning, color: Colors.red, size: 25,));
                  }
                } : null,
              ),
            ):null
          ),
          Container(width: 32,height: 40,alignment: Alignment.centerLeft,
            child: dataValidation != true ? dataValue == null ? icons[2] : icons[1] : icons[0],
          ),
          SizedBox(width: 3,),
          Container(height: 35,color: Colors.grey,width: 2,)
        ],
      );
    });
  }

  String getIdDoc(String idIndicateur) {
    String annee = pDashBoardController.currentYear.value;
    int index = pExtraDataController.extraDataQuery.value.entitesName.indexOf(pDashBoardController.currentEntity.value);
    final entityAbr = pExtraDataController.extraDataQuery.value.entitesAbr[index];
    final id = "${entityAbr}_${annee}_${idIndicateur}";
    return id;
  }

  Future validateDataIndicator(bool? value, int numeroIndicateur) async {
    int moisId = pDashBoardController.getMoisId();
    String entityId = userController.user.accesPilotage!.entitePrimaire!;
    int annee = int.parse(pDashBoardController.currentYear.value);

    bool result = await dioClient.validerIndicateur(
        value: true,
        rowId: numeroIndicateur - 1,
        annee: annee,
        entityId: entityId,
        moisId: moisId
    );

    if (result) {
      await pTableauController.onAppLoadingEntityData(entityId);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text("L'indicaterur a été bien validé"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text("Echec lors de la validation"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<bool> renseignerLaDonnee(IndicateurModel indicator, num? value, String? mois) async {
    if (indicator.intitule != null && mois != null) {
      DashBoardUtils.editDataRow(indicator, value, mois);
      return true;
    }
    return false;
  }
}
