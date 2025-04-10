import 'package:app_estudo_flutter/screens/desafios/numeros/desafio1.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio1_prof.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio2.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio2_prof.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio3.dart';
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
