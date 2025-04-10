import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistroClique {
  final int numero;
  final DateTime horario;

  RegistroClique({required this.numero, required this.horario});
}

class Desafio3 extends StatefulWidget {
  const Desafio3({super.key});

  @override
  State<Desafio3> createState() => _Desafio3State();
}

class _Desafio3State extends State<Desafio3> {
  List<RegistroClique> cliques = [];

  void registrarClique() {
    setState(() {
      cliques.add(
        RegistroClique(
          numero: cliques.length + 1,
          horario: DateTime.now(),
        ),
      );
    });
  }

  String formatarData(DateTime data) {
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio 3"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: registrarClique,
                child: Text("Clique Aqui"),
              ),
              SizedBox(height: 20),
              Text("Total de cliques: ${cliques.length}"),
              SizedBox(height: 20),
              // Para ListView funcionar dentro do SingleChildScrollView:
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cliques.length,
                itemBuilder: (context, index) {
                  final item = cliques[index];
                  return ListTile(
                    leading: Text("Clique ${item.numero}"),
                    title: Text(formatarData(item.horario)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
