import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(), 
          ),

          // box 1 і box 2
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyBox(
                  text:
                      'Ще не вмерла Україна, і слава, і воля,\n'
                      'Ще нам, браття молодії, усміхнеться доля.',
                  innerColor: Colors.yellow,
                  width: 150,
                  height: 100,
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(),
                ),

                const MyBox(
                  text:
                      'Згинуть наші вороженьки, як роса на сонці,\n'
                      'Запануєм і ми, браття, у своїй сторонці.',
                  innerColor: Colors.blue,
                  width: 220,
                  height: 100,
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(),
          ),

          // box 3
          const MyBox(
            text: 'І покажем, що ми, браття, козацького роду.',
            innerColor: Colors.white,
            width: 220,
            height: 120,
            alignRight: true,
          ),


          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(),
          ),
        ],
      ),
    );
  }
}


class MyBox extends StatelessWidget {
  final String text;
  final Color innerColor;
  final double width;
  final double height;
  final bool alignRight;

  const MyBox({
    super.key,
    required this.text,
    required this.innerColor,
    required this.width,
    required this.height,
    this.alignRight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignRight ? Alignment.centerRight : Alignment.center,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
        padding: const EdgeInsets.all(8),
        child: Container(
          color: innerColor,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(6),
          child: Text(
            text,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
