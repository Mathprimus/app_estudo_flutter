import 'package:flutter/material.dart';

class Desafio3Ref extends StatefulWidget {
  const Desafio3Ref({super.key});

  @override
  State<Desafio3Ref> createState() => _Desafio3RefState();
}

class _Desafio3RefState extends State<Desafio3Ref> {
  int numero = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio 3 reforço"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100),
              ContadorWidget(valor: numero),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              numero--;
                            });
                          },
                          child: Text("diminuir")),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              numero++;
                            });
                          },
                          child: Text("Aumentar")),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      numero = 0;
                    });
                  },
                  child: Text("Zerar"))
            ],
          ),
        ),
      ),
    );
  }
}

class ContadorWidget extends StatelessWidget {
  final int valor;

  const ContadorWidget({super.key, required this.valor});

  @override
  Widget build(BuildContext context) {
    Color cor;

    if (valor > 0) {
      cor = Colors.blue;
    } else if (valor < 0) {
      cor = Colors.red;
    } else {
      cor = Colors.black;
    }

    return Text(
      "$valor",
      style: TextStyle(color: cor),
    );
  }
}
