import 'package:flutter/material.dart';

void main() {

  double a = 24;
  double b = 34;
  double c = 64;
  double startWight = 300;

  runApp(
    Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Container(
            width: startWight,
            height: a + b + c,
            color: const Color.fromARGB(255, 241, 218, 8),
          ),
          Container(
            width: startWight - a,
            height: b + c,
            color: const Color.fromARGB(239, 236, 8, 8),
          ),
          Container(
            width: startWight - a - b,
            height: c,
            color: const Color.fromARGB(230, 8, 144, 248),
          ),

          Positioned(
            top: a + 7,
            right: startWight * 1/4,
            child: const Text(
              "Hello",
              textDirection: TextDirection.ltr,
              softWrap: true,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            bottom: 5,
            right: 5,
            child: const Text(
              "Flutter",
              textDirection: TextDirection.ltr,
              softWrap: true,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          )
          
        ],
      ),
    ),
  );
}
