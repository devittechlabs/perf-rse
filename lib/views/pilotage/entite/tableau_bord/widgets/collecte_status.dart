import 'package:flutter/material.dart';

import '../../../../../widgets/custom_text.dart';
import '../../../../../widgets/progress_bar.dart';


class CollecteStatus extends StatefulWidget {
  const CollecteStatus({Key? key}) : super(key: key);

  @override
  State<CollecteStatus> createState() => _CollecteStatusState();
}

class _CollecteStatusState extends State<CollecteStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          const CustomText(
            text: "Il reste 20 jours pour la collecte.",
          ),
          const SizedBox(width: 20,),
          Container(height: 20,width: 200,color: Colors.blue,),
          //ProgressBar(),
          const SizedBox(width: 5,),
          CustomText(
            text: "Vous etes à 47,17 % de collecte pour ce mois.",
          ),
        ],
      ),
    );
  }
}
