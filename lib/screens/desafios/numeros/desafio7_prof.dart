import 'package:flutter/material.dart';

class RegistrarItem {
  final String nome;
  final int quantidade;
  final int prioridade;
  bool comprado;

  RegistrarItem({
    required this.nome,
    required this.quantidade,
    required this.prioridade,
    this.comprado = false,
  });
}

class Desafio7_prof extends StatefulWidget {
  const Desafio7_prof({super.key});

  @override
  State<Desafio7_prof> createState() => _Desafio7_profState();
}

class _Desafio7_profState extends State<Desafio7_prof> {
  final TextEditingController nomeItem = TextEditingController();
  final TextEditingController quantidadeItem = TextEditingController();
  final TextEditingController prioridadeItem = TextEditingController();

  final List<RegistrarItem> itens = [];

  void registrarItem() {
    final nome = nomeItem.text.trim();
    final quantidade = int.tryParse(quantidadeItem.text.trim());
    final prioridade = int.tryParse(prioridadeItem.text.trim());

    if (nome.isEmpty || quantidade == null || prioridade == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Preencha todos os campos corretamente."),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      itens.add(RegistrarItem(
        nome: nome,
        quantidade: quantidade,
        prioridade: prioridade,
      ));
      nomeItem.clear();
      quantidadeItem.clear();
      prioridadeItem.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Item adicionado com sucesso!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void excluirItem(int index) {
    final nome = itens[index].nome;
    setState(() {
      itens.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Item '$nome' excluído com sucesso."),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio 7 - Lista de Compras"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nomeItem,
                      decoration: InputDecoration(labelText: "Nome do item"),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: quantidadeItem,
                      decoration: InputDecoration(labelText: "Quantidade"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: prioridadeItem,
                      decoration:
                          InputDecoration(labelText: "Prioridade (1 a 3)"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: registrarItem,
                child: Text("Adicionar Item"),
              ),
              SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: itens.length,
                itemBuilder: (context, index) {
                  final item = itens[index];

                  Color corCard;
                  if (item.comprado) {
                    corCard = Colors.grey.shade400;
                  } else if (item.prioridade == 1) {
                    corCard = Colors.blue.shade200;
                  } else if (item.prioridade == 2) {
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
                            "${item.nome} | Quantidade: ${item.quantidade} | Prioridade: ${item.prioridade}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: item.comprado
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
                                    value: item.comprado,
                                    onChanged: (newValue) {
                                      setState(() {
                                        item.comprado = newValue!;
                                      });
                                    },
                                  ),
                                  Text("Comprado"),
                                ],
                              ),
                              IconButton(
                                onPressed: () => excluirItem(index),
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
