import 'package:flutter/material.dart';

class CopyRight extends StatelessWidget {
  const CopyRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFF6E4906),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child:Text(
              "Copyright @ Vision & Strategie Holding ${width} x ${height}",
              style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
