import 'package:flutter/material.dart';
import 'package:perfrse/pilotage/models_pilotage/indicateur_pilotage_model.dart';

import '../../../../constants_pilotages/controllers_pilotage.dart';
import 'indicateur_widgets.dart';

class EnjeuWidget extends StatefulWidget {
  final String numero;
  final String idPilier;
  final String idEnjeu;
  final String enjeuTitle;
  final Map dropDownState;
  final Color color;
  const EnjeuWidget(
      {Key? key,
        required this.enjeuTitle,
        required this.idEnjeu,
        required this.dropDownState,
        required this.idPilier,
        required this.color,
        required this.numero})
      : super(key: key);

  @override
  State<EnjeuWidget> createState() => _EnjeuWidgetState();
}

class _EnjeuWidgetState extends State<EnjeuWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          padding: const EdgeInsets.only(left: 100),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: widget.color.withOpacity(0.7),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(4.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${widget.numero}. ${widget.enjeuTitle}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              RotatedBox(
                quarterTurns: widget.dropDownState[widget.idEnjeu] ? 1 : 3,
                child: IconButton(
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 15,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    if (widget.dropDownState[widget.idEnjeu]) {
                      pDashBoardController.changeStateEnjeu(
                          widget.idPilier, widget.idEnjeu, false);
                    } else {
                      pDashBoardController.changeStateEnjeu(
                          widget.idPilier, widget.idEnjeu, true);
                    }
                  },
                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
        ),
        Visibility(
          visible: widget.dropDownState["value"]
              ? widget.dropDownState[widget.idEnjeu]
              : false,
          child: Column(
            children: getIndicateurWidget(widget.idEnjeu),
            //IndicateurWidget(numeroIndicateur: 5,)
            //IndicateurWidget(numeroIndicateur: 1,)
          ),
        )
      ],
    );
  }

  List<Widget> getIndicateurWidget(String idEnjeu){
    List<IndicateurModel> listIndicateurs = pTableauController.indicateurs.where(
            (indicateur) => indicateur.enjeu == widget.idEnjeu
    ).toList();

    return listIndicateurs.map(
            (indicateur){
          return IndicateurWidget(indicateur: indicateur);
        }
    ).toList();
  }

}