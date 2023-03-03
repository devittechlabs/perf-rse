import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perf_rse/widgets/copyright.dart';
import '../../../constants/colors.dart';
import '../../../widgets/custom_text.dart';

class PageNotFound extends StatefulWidget {
  @override
  State<PageNotFound> createState() => _PageNotFoundState();
}

class _PageNotFoundState extends State<PageNotFound> {
  bool onHoverLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            color: headerApp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 100),
                  child: Center(
                    child: Image.asset(
                      "assets/logos/perf_rse.png",
                      height: 50,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 100),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            context.go('/accounts/login');
                          },
                          onHover: (value) {
                            if (value) {
                              setState(() {
                                onHoverLogin = true;
                              });
                            } else {
                              setState(() {
                                onHoverLogin = false;
                              });
                            }
                          },
                          child: CustomText(
                            text: "Se Connecter",
                            color: onHoverLogin ? Colors.white : Colors.black,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CustomText(
                        text: "FR",
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/error.png",
                width: 600,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        context.go('/');
                      },
                      hoverColor: Colors.amber,
                      child: const CustomText(
                        text: "Retournez à l'accueil principale de Perf RSE",
                        size: 24,
                        weight: FontWeight.bold,
                      )),
                ],
              )
            ],
          )),
          CopyRight(),
        ],
      ),
    );
  }
}
