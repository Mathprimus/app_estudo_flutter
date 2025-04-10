import 'package:app_estudo_flutter/screens/desafios/numeros/desafio1.dart';
import 'package:app_estudo_flutter/screens/desafios/numeros/desafio1_prof.dart';
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
