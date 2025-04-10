import 'package:flutter/material.dart';

class Desafio1_prof extends StatefulWidget {
  const Desafio1_prof({super.key});

  @override
  State<Desafio1_prof> createState() => _Desafio1_profState();
}

class _Desafio1_profState extends State<Desafio1_prof> {
  int numero = 0;

  Color _definirCorNumero() {
    if (numero > 0) return Colors.blue;
    if (numero < 0) return Colors.red;
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio1"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numero.toString(),
                style: TextStyle(
                  color: _definirCorNumero(),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => numero--),
                    child: Text("Diminuir"),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => setState(() => numero++),
                    child: Text("Aumentar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            numero = 0;
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
