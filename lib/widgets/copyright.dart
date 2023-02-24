import 'package:flutter/material.dart';

class CopyRight extends StatelessWidget {
  const CopyRight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFF6E4906),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child:Text(
              "Copyright @ Vision & Strategie Holding",
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
