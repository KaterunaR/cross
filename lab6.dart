import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // box 1
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 150,
                      maxWidth: 150,
                      minHeight: 100,
                      maxHeight: 100,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8), 
                        child: Container(
                          color: Colors.yellow,
                          alignment: Alignment.center,
                          child: const Text(
                            'Ще не вмерла Україна, і слава, і воля, Ще нам, браття молодії, усміхнеться доля.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Container(),
                  ),

                  // box 2
                  Container(
                    width: 220,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        color: Colors.blue, 
                        alignment: Alignment.center,
                        child: const Text(
                          'Згинуть наші вороженьки, як роса на сонці,Запануєм і ми, браття, у своїй сторонці.',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(),
          ),

          // box 3
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20), 
              child: Container(
                width: 220,
                height: 120,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: const Text(
                  'І покажем, що ми, браття, козацького роду.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),



          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(),
          ),
        ],
      ),
    ),
  );
}
