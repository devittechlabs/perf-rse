import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class CopyRight extends StatelessWidget {
  const CopyRight({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final box = GetStorage();
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF6E4906),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: RichText(
              text: TextSpan(
                text: "Copyright @ Vision & Strategie Holding Status : ",
                children: [
                  TextSpan(text: "Aucune connexion internet",style: TextStyle(color: Colors.red))
                ],
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
