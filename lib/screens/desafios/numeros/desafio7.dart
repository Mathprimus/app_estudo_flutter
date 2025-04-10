import 'package:flutter/material.dart';

class RegistrarItem {
  final String nome;
  final int quantidade;
  final int prioridade;
  bool comprado;

  RegistrarItem(
      {required this.nome,
      required this.quantidade,
      required this.prioridade,
      this.comprado = false});
}

class Desafio7 extends StatefulWidget {
  const Desafio7({super.key});

  @override
  State<Desafio7> createState() => _Desafio7State();
}

class _Desafio7State extends State<Desafio7> {
  TextEditingController nomeItem = TextEditingController();
  TextEditingController quantidadeItem = TextEditingController();
  TextEditingController priotidadeItem = TextEditingController();

  List<RegistrarItem> itens = [];

  void registrarItem() {
    final nome = nomeItem.text.trim();
    final quantidade = quantidadeItem.text.trim();
    final prioridade = priotidadeItem.text.trim();

    if (nome.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Coloque um nome no item"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
      ));
      return;
    }

    if (quantidade.isEmpty || prioridade.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Coloque os valores necessarios"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
      ));
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Item criado com sucesso"),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 5),
    ));

    setState(() {
      itens.add(RegistrarItem(
          nome: nome,
          quantidade: int.parse(quantidade),
          prioridade: int.parse(prioridade)));
    });
  }

  void excluirItem(int index) {
    setState(() {
      itens.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio 7"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 100),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: nomeItem,
                      decoration: InputDecoration(labelText: "Nome do Item"),
                    )),
                    SizedBox(width: 20),
                    Expanded(
                        child: TextField(
                      controller: quantidadeItem,
                      decoration: InputDecoration(labelText: "Quantidade"),
                    )),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        controller: priotidadeItem,
                        decoration:
                            InputDecoration(labelText: "prioridade do item"),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: registrarItem, child: Text("Salvar item")),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itens.length,
                  itemBuilder: (context, index) {
                    final item = itens[index];
                    Color corPrioridade;
                    if (item.prioridade == 1) {
                      corPrioridade = Colors.blue;
                    } else if (item.prioridade == 2) {
                      corPrioridade = Colors.yellow;
                    } else {
                      corPrioridade = Colors.red;
                    }
                    return Card(
                        color: corPrioridade,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          "${item.nome}, Quantidade: ${item.quantidade}, Prioridade: ${item.prioridade}")
                                    ],
                                  ),
                                  Checkbox(
                                      value: item.comprado,
                                      onChanged: (newValue) {
                                        setState(() {
                                          item.comprado = newValue!;
                                          corPrioridade = Colors.white;
                                        });
                                      }),
                                  IconButton(
                                      onPressed: () {
                                        excluirItem(index);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text("Item excluido com sucesso"),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 4),
                                        ));
                                      },
                                      icon: Icon(Icons.delete))
                                ])));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
