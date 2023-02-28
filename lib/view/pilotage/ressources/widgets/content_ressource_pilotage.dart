import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perf_rse/constants/colors.dart';
import 'package:perf_rse/modules/styled_scrollview.dart';

class ContentRessourcePilotage extends StatefulWidget {
  const ContentRessourcePilotage({Key? key}) : super(key: key);

  @override
  State<ContentRessourcePilotage> createState() => _ContentRessourcePilotageState();
}

class _ContentRessourcePilotageState extends State<ContentRessourcePilotage> {
  double scale = 4.3;
  @override
  Widget build(BuildContext context) {
    final height = context.height;
    return StyledScrollView(
      child: Stack(
        children: [
          Positioned(
            right: 50,
            child: Container(
              child: IconButton(
                onPressed: (){
                  setState(() {
                    scale = scale + 0.1;
                  });
                },
                icon: Icon(Icons.zoom_in,color: Colors.grey,size: 50,),
              ),
            ),
          ),
          Positioned(
            right: 50,
            top: 50,
            child: IconButton(
              hoverColor: activeBlue,
              color: Colors.grey,
              onPressed: (){
                setState(() {
                  scale = scale - 0.1;
                });
              },
              icon: Icon(Icons.zoom_out,size: 50,),
            ),
          ),
          Container(
            width: double.maxFinite,
            //color: Colors.red,
            child: Center(child: Image.asset("assets/images/organigramme.png",scale: scale,fit: BoxFit.fill,)),
          ),
        ],
      ),
    );
  }
}
