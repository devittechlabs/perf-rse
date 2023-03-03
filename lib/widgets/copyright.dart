import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:perf_rse/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class CopyRight extends StatefulWidget {
  const CopyRight({Key? key}) : super(key: key);

  @override
  State<CopyRight> createState() => _CopyRightState();
}

class _CopyRightState extends State<CopyRight> {
  bool isConnected = false ;

  @override
  void initState() {
    getInternetStatus();
    super.initState();
  }


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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: InkWell(
              onTap: () async {
                const url = "https://visionstrategie.com/";
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
                else {
                  throw "Could not launch $url";
                }
              },
              child: const CustomText(
                  text: "Copyright @ Vision & Strategie Holding",
                 size: 15,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: RichText(
              text: TextSpan(
                text: "Status : ",
                children: [
                  TextSpan(
                      text: isConnected ? "Connecté" : "Aucune connection internet" ,
                      style: TextStyle(color: isConnected ? Colors.green: Colors.red))
                ],
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  void  getInternetStatus() async {
    while (true) {
      try {
        var response = await http.get(Uri.parse('https://test-vsh-api.onrender.com/'),headers: {
          "Access-Control-Allow-Origin":"*"
        });
        if (response.statusCode == 200) {
          setState(() {
            isConnected = true;
          });
        }
      } catch (e){
        setState(() {
          isConnected = false;
        });
      }
      await Future.delayed(Duration(milliseconds: 500));
    }
  }
}
