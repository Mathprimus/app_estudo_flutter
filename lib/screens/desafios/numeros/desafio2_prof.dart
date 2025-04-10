import 'package:flutter/material.dart';

class Desafio2_prof extends StatefulWidget {
  const Desafio2_prof({super.key});

  @override
  State<Desafio2_prof> createState() => _Desafio2_profState();
}

class _Desafio2_profState extends State<Desafio2_prof> {
  final TextEditingController peso = TextEditingController();
  final TextEditingController altura = TextEditingController();
  double imc = 0.0;

  String _classificarIMC(double imc) {
    if (imc < 18.5) return "Abaixo do peso";
    if (imc < 25) return "Peso normal";
    if (imc < 30) return "Sobrepeso";
    return "Obesidade";
  }

  double? _tratarAltura(String valor) {
    double? altura = double.tryParse(valor.replaceAll(',', '.'));
    if (altura == null) return null;

    // Se o valor for maior que 3, provavelmente foi digitado em cm (ex: 170)
    if (altura > 3) {
      altura = altura / 100; // Transforma 170 em 1.70
    }

    return altura;
  }

  void _calcularIMC() {
    double? pesoValor =
        double.tryParse(peso.text.replaceAll(',', '.')); // trata vírgula
    double? alturaValor = _tratarAltura(altura.text);

    if (pesoValor == null || alturaValor == null || alturaValor == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preencha os campos corretamente.")),
      );
      return;
    }

    setState(() {
      imc = pesoValor / (alturaValor * alturaValor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio 2 - IMC"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: peso,
                      decoration: InputDecoration(
                        labelText: "Peso (kg)",
                        hintText: "Ex: 70 ou 70,5",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: altura,
                      decoration: InputDecoration(
                        labelText: "Altura (m)",
                        hintText: "Ex: 1.70 ou 170",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _calcularIMC,
                  child: Text("Calcular IMC"),
                ),
              ),
              SizedBox(height: 20),
              if (imc > 0) ...[
                Text(
                  "IMC: ${imc.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 8),
                Text(
                  _classificarIMC(imc),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
