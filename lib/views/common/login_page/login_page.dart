import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controller/auth_controller.dart';
import '../../../widgets/export_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final AuthController authController  = Get.find();

  final _formKey = GlobalKey<FormState>();
  bool _obsureText = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool isLoadedPage = false;

  bool onLogging = false;
  bool isLogging = false;

  void loadingLoginPage() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isLoadedPage = true;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double factor = 1.0;
    double height = MediaQuery.of(context).size.height;
    if (height >= 900 ) {
      factor = 1.0;
    } else if (height < 900 && height > 500 ){
      factor = 900 / height ;
    } else {
      factor = -1 ;
    }
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/fond_accueil.jpg",
                    ),
                    fit: BoxFit.fill)),
            child: factor == -1 ? Container() : Row(
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 150,width: 300/factor,
                          child: Image.asset("assets/logos/perf_rse.png",height: 150/factor,
                          ),),
                        SizedBox(height: 30/factor,),
                        Image.asset("assets/images/ordinateur.png",height: 350/factor,),
                        SizedBox(height: 20/factor,),
                        SizedBox(height: 20/factor,),
                        RichText(
                          text: TextSpan(
                            text: "Avec ",
                            style: TextStyle(fontSize: 30/factor,fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,color: Color(0xFF6E4906)),
                            children: <TextSpan>[
                              TextSpan(text: "Performance ",style: TextStyle(color: Color(0xFF2A9836))),
                              TextSpan(text: "RSE",style: TextStyle(color: Color(0xFF0F70B7))),
                              TextSpan(text: ", piloter et mesurer "
                                  "votre stratégie ""de Développement Durable en toute simplicité."),
                            ]
                          ),

                        )
                      ],
                    )),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 150,width: 300, child: Image.asset(
                          "assets/logos/logo_sifca_bon.png",
                          height: 150/factor,
                        ),),
                        const SizedBox(height: 30,),
                        SizedBox(
                          width: 400,
                          height: 400/factor,
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Se connecter à votre compte",
                                      style: TextStyle(
                                          fontSize: 25/factor,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9D6E16)),
                                    ),
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
                                          controller: _emailController,
                                        ),
                                        SizedBox(
                                          height: 20/factor,
                                        ),
                                        TextFormField(
                                          obscureText: _obsureText,
                                          controller: _passwordController,
                                          decoration: InputDecoration(
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _obsureText = !_obsureText;
                                                  });
                                                },
                                                child: Icon(_obsureText
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                              ),
                                              hintText: "Mot de passe",
                                              prefixIcon:
                                              Icon(Icons.vpn_key_sharp),
                                              contentPadding:
                                              const EdgeInsets.only(
                                                  left: 20.0,
                                                  right: 20.0),
                                              border:
                                              const OutlineInputBorder(),
                                              focusedBorder:
                                              OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Theme.of(
                                                          context)
                                                          .primaryColor,
                                                      width: 2))),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    ElevatedButton(
                                        onPressed: () async {
                                          authController.saveUserData(_emailController.text.trim());
                                          context.go('/');
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
                                            text: "Se connecter",
                                            color: Colors.white,
                                          ),
                                        )),
                                    const SizedBox(height: 10,),
                                    TextButton(
                                        onPressed: (){
                                          context.go('/accounts/forgot-password');
                                        },
                                        child: const CustomText(
                                      text: "J’ai oublié mon mot de passe",
                                      color: activeBlue,
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
            const CopyRight()
      ],
    ));
  }
}
