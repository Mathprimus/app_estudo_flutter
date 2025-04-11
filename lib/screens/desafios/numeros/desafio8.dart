import 'package:flutter/material.dart';

class RegistrarTarefa {
  final String nome;
  final int prioridade;
  bool feito;
  RegistrarTarefa(
      {required this.nome, required this.prioridade, this.feito = false});
}

class Desafio8 extends StatefulWidget {
  const Desafio8({super.key});

  @override
  State<Desafio8> createState() => _Desafio8State();
}

class _Desafio8State extends State<Desafio8> {
  final TextEditingController nomeTarefa = TextEditingController();
  final TextEditingController prioridadeTarefa = TextEditingController();

  final List<RegistrarTarefa> tarefas = [];
  String filtroSelecionado = 'Todos';

  void registrarTarefa() {
    final nome = nomeTarefa.text.trim();
    final prioridade = int.parse(prioridadeTarefa.text.trim());

    if (prioridade > 3 || prioridade < 1) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          content: Text("Só é permitido um numero de 1 a 3")));
      return;
    }

    if (nome.isEmpty || prioridade == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
          content: Text("preencha todos os campos corretamente")));
      return;
    }
    setState(() {
      tarefas.add(RegistrarTarefa(nome: nome, prioridade: prioridade));
      nomeTarefa.clear();
      prioridadeTarefa.clear();
    });
  }

  void excluirTarefa(RegistrarTarefa tarefa) {
    final nome = tarefa.nome;
    setState(() {
      tarefas.remove(tarefa);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Item $nome excluído com sucesso"),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    List<RegistrarTarefa> tarefasFiltradas = tarefas.where((tarefa) {
      if (filtroSelecionado == 'Todos') return true;
      if (filtroSelecionado == 'feito') return tarefa.feito;
      if (filtroSelecionado == 'Pendentes') return !tarefa.feito;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio 8"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nomeTarefa,
                      decoration: InputDecoration(labelText: "Nome do item"),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: prioridadeTarefa,
                      decoration:
                          InputDecoration(labelText: "Prioridade (1 a 3)"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: registrarTarefa,
                child: Text("Adicionar Item"),
              ),
              DropdownButton<String>(
                  value: filtroSelecionado,
                  items: ['feito', 'Pendentes', 'Todos']
                      .map((filtro) => DropdownMenuItem(
                            value: filtro,
                            child: Text(filtro),
                          ))
                      .toList(),
                  onChanged: (valor) {
                    setState(() {
                      filtroSelecionado = valor!;
                    });
                  }),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tarefasFiltradas.length,
                itemBuilder: (context, index) {
                  final tarefa = tarefasFiltradas[index];

                  Color corCard;
                  if (tarefa.feito) {
                    corCard = Colors.grey.shade400;
                  } else if (tarefa.prioridade == 1) {
                    corCard = Colors.blue.shade200;
                  } else if (tarefa.prioridade == 2) {
                    corCard = Colors.yellow.shade200;
                  } else {
                    corCard = Colors.red.shade200;
                  }

                  return Card(
                    color: corCard,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${tarefa.nome} | Prioridade: ${tarefa.prioridade}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: tarefa.feito
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: tarefa.feito,
                                    onChanged: (newValue) {
                                      setState(() {
                                        tarefa.feito = newValue!;
                                      });
                                    },
                                  ),
                                  Text("Comprado"),
                                ],
                              ),
                              IconButton(
                                onPressed: () =>
                                    excluirTarefa(tarefasFiltradas[index]),
                                icon: Icon(Icons.delete, color: Colors.red),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
