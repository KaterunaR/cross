import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MyHomePage(),
      ),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomBox(
                    text:
                        'Ще не вмерла Україна, і слава, і воля, Ще нам, браття молодії, усміхнеться доля.',
                    color: Colors.yellow,
                    width: 150,
                    height: 100,
                  ),
                  SizedBox(width: 50),
                  CustomBox(
                    text:
                        'Згинуть наші вороженьки, як роса на сонці, Запануєм і ми, браття, у своїй сторонці.',
                    color: Colors.blue,
                    width: 220,
                    height: 100,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 150),

          // Box 3 справа
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CustomBox(
                text: 'І покажем, що ми, браття, козацького роду.',
                color: Colors.white,
                width: 220,
                height: 120,
              ),
            ),
          ),

          SizedBox(height: 150),
        ],
      ),
    );
  }
}

// StatefulWidget
class CustomBox extends StatefulWidget {
  final String text;
  final Color color;
  final double width;
  final double height;

  const CustomBox({
    Key? key,
    required this.text,
    required this.color,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _CustomBoxState createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  bool isTapped = false;

  void toggleHighlight() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleHighlight,
      child: Container(
        width: isTapped? widget.width * 1.5 : widget.width,
        height: isTapped? widget.height * 1.5 : widget.height,
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(color: Colors.black),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 12,
              color: isTapped ? Colors.red : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
