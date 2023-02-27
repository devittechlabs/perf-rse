import 'package:flutter/material.dart';
import 'package:perf_rse/widgets/copyright.dart';
import 'package:perf_rse/widgets/custom_text.dart';

import '../../../constants/colors.dart';
import 'widgets/confirm_reseting.dart';
import 'controllers/reseting_password_controller.dart';
import 'package:get/get.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final resetPassWordController = Get.put(ResetPassWordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/fond_accueil.jpg",
                ),
                fit: BoxFit.fill)),
        child: Column(
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
                child: Center(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: Obx(() {
                  final step = resetPassWordController.resetStep.value;
                  if (step == 1) {
                    return ConfirmReset();
                  }else if (step == 2) {
                    return Center(
                      child: Text(
                        "Veillez s'il vous plait consulter votre boite mail (fabdev6@gmail.com) pour "
                            "finaliser la procédure de réinstialisation de votre mot de passe."
                      ),
                    );
                  }else {
                    return ConfirmReset();
                  }
                }),
              ),
            )),
            CopyRight(),
          ],
        ),
      ),
    );
  }
}
