import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:perf_rse/widgets/custom_text.dart';

import '../../../../constants/colors.dart';
import '../controllers/reseting_password_controller.dart';

class ConfirmReset extends StatefulWidget {
  const ConfirmReset({Key? key}) : super(key: key);

  @override
  State<ConfirmReset> createState() => _ConfirmResetState();
}

class _ConfirmResetState extends State<ConfirmReset> {

  final resetPassWordController = Get.put(ResetPassWordController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 400,
      height: 500,
      child: Center(
        child: Container(
          height: 350,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: "Réinitialiser le mot de passe",size: 20,weight: FontWeight.bold,color: Color(0xFF9D6E16),),
              SizedBox(height: 20,),
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Saisissez votre adresse e-mail.",size: 15,),
                      Form(
                        autovalidateMode:
                        AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Courriel",
                                      prefixIcon: Icon(Icons.person),
                                      contentPadding:
                                      const EdgeInsets.only(
                                          left: 20.0,
                                          right: 20.0),
                                      border: OutlineInputBorder(),
                                      focusedBorder:
                                      OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Theme.of(
                                                  context)
                                                  .primaryColor,
                                              width: 2))),
                                  //controller: _emailController,
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            ElevatedButton(
                                onPressed: () async {
                                  resetPassWordController.resetStep.value = 2;
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  shape: const StadiumBorder(),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.maxFinite,
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: const CustomText(
                                    text: "Continuer",
                                    color: Colors.black,
                                  ),
                                )),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.maxFinite,
                child: Center(
                  child: InkWell(
                      onTap: (){
                        context.go('/accounts/login');
                      },
                      child: CustomText(
                        text: "Connectez-vous maintenant",
                        color: activeBlue,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
