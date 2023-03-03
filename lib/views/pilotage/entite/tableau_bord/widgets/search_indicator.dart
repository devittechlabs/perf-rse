import 'package:flutter/material.dart';

import '../../../../../widgets/custom_text.dart';

class SearchIndicator extends StatelessWidget {
  const SearchIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(right:10),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 600,
              constraints: const BoxConstraints(
                minWidth: 200 ///400
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Recherche d'un indicateur, mots clés",
                    fillColor: Colors.white70),
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                elevation: 0,
              ),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                child: const CustomText(
                  text: "Soumettre",
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}