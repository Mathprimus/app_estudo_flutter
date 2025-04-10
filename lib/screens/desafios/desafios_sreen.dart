import 'package:app_estudo_flutter/screens/desafios/numeros/desafio1.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio1_prof.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio2.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio2_prof.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio3.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio3_ref.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio4.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio5.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio5_prof.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio6.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio6_prof.dart';
import 'package:flutter/material.dart';

class DesafiosSreen extends StatefulWidget {
  const DesafiosSreen({super.key});

  @override
  State<DesafiosSreen> createState() => _DesafiosSreenState();
}

class _DesafiosSreenState extends State<DesafiosSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Desafios")),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio1(),
                        ),
                      );
                    },
                    child: Text("Desafio 1"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio1_prof(),
                        ),
                      );
                    },
                    child: Text("Desafio 1 Prof"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio2(),
                        ),
                      );
                    },
                    child: Text("Desafio 2"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio2_prof(),
                        ),
                      );
                    },
                    child: Text("Desafio 2 Prof"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio3(),
                        ),
                      );
                    },
                    child: Text("Desafio 3"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio3Ref(),
                        ),
                      );
                    },
                    child: Text("Desafio 3 reforço"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio4(),
                        ),
                      );
                    },
                    child: Text("Desafio 4"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio5(),
                        ),
                      );
                    },
                    child: Text("Desafio 5"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio5_prof(),
                        ),
                      );
                    },
                    child: Text("Desafio 5 prof"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio6(),
                        ),
                      );
                    },
                    child: Text("Desafio 6"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Desafio6_prof(),
                        ),
                      );
                    },
                    child: Text("Desafio 6 Prof"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
