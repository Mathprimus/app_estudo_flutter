import 'package:flutter/material.dart';

class Desafio2 extends StatefulWidget {
  const Desafio2({super.key});

  @override
  State<Desafio2> createState() => _Desafio2State();
}

class _Desafio2State extends State<Desafio2> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  double imc = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio 2 - IMC"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: peso,
                      decoration: InputDecoration(labelText: "Peso em kg"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: altura,
                      decoration: InputDecoration(labelText: "Altura em m"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      imc = double.parse(peso.text) /
                          (double.parse(altura.text) *
                              double.parse(altura.text));
                    });
                  },
                  child: Text("Calcular IMC")),
            ),
            SizedBox(height: 20),
            Text("$imc"),
            SizedBox(height: 20),
            if (imc < 18.5) Text("Abaixo do peso"),
            if (imc < 25 && imc > 18) Text("Peso normal"),
            if (imc < 30 && imc > 25) Text("Sobrepeso"),
            if (imc > 30) Text("Obesidade")
          ],
        ),
      ),
    );
  }
}
