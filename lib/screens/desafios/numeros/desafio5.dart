import 'package:flutter/material.dart';

class RegistrarItens {
  final String nome;
  final int quantidade;
  bool comprado;
  RegistrarItens(
      {required this.nome, required this.quantidade, this.comprado = false});
}

class Desafio5 extends StatefulWidget {
  const Desafio5({super.key});

  @override
  State<Desafio5> createState() => _Desafio5State();
}

class _Desafio5State extends State<Desafio5> {
  TextEditingController nomeItem = TextEditingController();
  TextEditingController quantidadeItem = TextEditingController();
  bool? comprado = false;
  List<RegistrarItens> itens = [];

  void registrarItem() {
    setState(() {
      itens.add(RegistrarItens(
          nome: nomeItem.text, quantidade: int.parse(quantidadeItem.text)));
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
        title: Text("Desafio 5"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 100),
                TextField(
                  controller: nomeItem,
                  decoration: InputDecoration(labelText: "Nome Item"),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: quantidadeItem,
                  decoration: InputDecoration(labelText: "Quantide do item"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: registrarItem, child: Text("Salvar Item")),
                SizedBox(height: 30),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: itens.length,
                    itemBuilder: (context, index) {
                      final item = itens[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text("${item.nome}"),
                          subtitle: Text("Quantidade: ${item.quantidade}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: item.comprado,
                                activeColor: Colors.green,
                                onChanged: (newValue) {
                                  setState(() {
                                    item.comprado = newValue!;
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => excluirItem(index),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
