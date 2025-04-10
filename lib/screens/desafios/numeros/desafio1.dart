import 'package:flutter/material.dart';

class Desafio1 extends StatefulWidget {
  const Desafio1({super.key});

  @override
  State<Desafio1> createState() => _Desafio1State();
}

class _Desafio1State extends State<Desafio1> {
  int numero = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio1"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              if (numero > 0)
                Text(
                  numero.toString(),
                  style: TextStyle(color: Colors.blue),
                ),
              if (numero < 0)
                Text(
                  numero.toString(),
                  style: TextStyle(color: Colors.red),
                ),
              if (numero == 0)
                Text(
                  numero.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          numero--;
                        });
                      },
                      child: Text("Diminuir")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          numero++;
                        });
                      },
                      child: Text("Aumentar")),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      numero = 0;
                    });
                  },
                  child: Text("Zerar")),
            ],
          ),
        ),
      ),
    );
  }
}
