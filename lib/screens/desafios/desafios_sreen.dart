import 'package:app_estudo_flutter/screens/desafios/numeros/desafio1.dart';
import 'package:flutter/material.dart';

class DesafiosSreen extends StatefulWidget {
  const DesafiosSreen({super.key});

  @override
  State<DesafiosSreen> createState() => _DesafiosSreenState();
}

class _DesafiosSreenState extends State<DesafiosSreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(title: Text("Desafios")),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Desafio1()));
                    },
                    child: Text("Desafio 1")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
