import 'package:flutter/material.dart';
import '../../../../widgets/export_widget.dart';

AppBar headerMainPage({required String? name}) {
  return AppBar(
    backgroundColor: Color(0xFFAAA095),
    elevation: 0.0,
    leadingWidth: 500,
    leading: Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Image.asset(
              "assets/logos/perf_rse.png",
              height: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            CustomText(
              text: "Accueil Générale",
              color: Colors.black,
              weight: FontWeight.bold,
              size: 30,
            )
          ],
        ),
      ),
    ),
    actions: [
      Center(
        child: CustomText(
          text: "${name}",
          color: Colors.white,
          weight: FontWeight.bold,
          size: 20,
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      CircleAvatar(
            backgroundColor: Color(0xFFFFFF00),
            child: Center(
              child: CustomText(
                text: "HH",
                color: Color(0xFFF1C232),
                weight: FontWeight.bold,
              ),
            ),
          ),
      const SizedBox(
        width: 30,
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
      ),
      const SizedBox(
        width: 30,
      ),
    ],
  );
}