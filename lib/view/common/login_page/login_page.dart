import 'package:flutter/material.dart';

import '../../../widgets/export_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 150,width: 300,
                          child: Image.asset("assets/logos/perf_rse.png",height: 150,
                          ),),
                        const SizedBox(height: 30,),
                        Image.asset("assets/images/ordinateur.png",height: 350,),
                        const SizedBox(height: 20,),
                        //CustomText(text: "Performance",size: 80,weight: FontWeight.bold,color: Color(0xFF2B78E4),),
                        //const CustomText(text: "RSE",size: 40,weight: FontWeight.bold,color: Color(0xFF009E0F),),
                        const SizedBox(height: 20,),
                        const Text("Avec Performance RSE, piloter et mesurer votre stratégie de Développement Durable en toute simplicité.",style: TextStyle(
                              fontSize: 25,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Color(0xFF6E4906)),),
                      ],
                    )),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 150,width: 300,
                        child: Image.asset(
                          "assets/logos/logo_sifca_bon.png",
                          height: 150,
                        ),),
                        const SizedBox(height: 30,),
                        SizedBox(
                          width: 400,
                          height: 400,
                          child: Card(
                            elevation: 6,
                            shape: Border.all(
                                color: const Color(0xFFE8B223), width: 4),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Form(
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      "Se connecter à votre compte",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF9D6E16)),
                                    ),
                                    Container(
                                      child: Column(
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
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          TextFormField(
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      //_obsureText = !_obsureText;
                                                    });
                                                  },
                                                  child: Icon(true
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
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
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
