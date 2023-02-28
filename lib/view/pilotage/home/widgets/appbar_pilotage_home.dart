import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/custom_text.dart';


class AppBarPilotageHome extends StatefulWidget {
  const AppBarPilotageHome({Key? key}) : super(key: key);

  @override
  State<AppBarPilotageHome> createState() => _AppBarPilotageHomeState();
}

class _AppBarPilotageHomeState extends State<AppBarPilotageHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 20,right: 20),
      color: headerApp,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: (){
                  context.go("/");
                },
                child: Image.asset(
                  "assets/logos/perf_rse.png",
                  height: 50,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              const CustomText(
                text: "Accueil Pilotage RSE",
                color: Colors.black,
                weight: FontWeight.bold,
                size: 30,
              ),
            ],
          ),
          TextButton(
            child: const Text(
              "A propos de Perf RSE",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  decoration: TextDecoration.underline),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
