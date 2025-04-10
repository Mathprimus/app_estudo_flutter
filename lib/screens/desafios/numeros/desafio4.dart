import 'package:flutter/material.dart';

class RegistrarTarefas {
  final String texto;

  RegistrarTarefas({required this.texto});
}

class Desafio4 extends StatefulWidget {
  const Desafio4({super.key});

  @override
  State<Desafio4> createState() => _Desafio4State();
}

class _Desafio4State extends State<Desafio4> {
  TextEditingController textoTarefa = TextEditingController();
  List<RegistrarTarefas> tarefas = [];

  void registrarTarefa() {
    setState(() {
      tarefas.add(RegistrarTarefas(texto: textoTarefa.text));
    });
  }

  void excluirTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio 4"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: textoTarefa,
                decoration: InputDecoration(labelText: "Qual a tarefa?"),
              ),
              ElevatedButton(
                  onPressed: registrarTarefa, child: Text("Salvar Tarefa")),
              SizedBox(height: 20),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: tarefas.length,
                  itemBuilder: (context, index) {
                    final item = tarefas[index];
                    return ListTile(
                      leading: IconButton(
                          onPressed: () => excluirTarefa(index),
                          icon: Icon(Icons.delete)),
                      title: Text("Tarefa: ${item.texto}"),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
