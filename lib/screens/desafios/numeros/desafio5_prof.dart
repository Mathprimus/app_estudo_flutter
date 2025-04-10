import 'package:flutter/material.dart';

class RegistrarItens {
  final String nome;
  final int quantidade;
  bool comprado;

  RegistrarItens({
    required this.nome,
    required this.quantidade,
    this.comprado = false,
  });
}

class Desafio5_prof extends StatefulWidget {
  const Desafio5_prof({super.key});

  @override
  State<Desafio5_prof> createState() => _Desafio5_profState();
}

class _Desafio5_profState extends State<Desafio5_prof> {
  TextEditingController nomeItem = TextEditingController();
  TextEditingController quantidadeItem = TextEditingController();
  List<RegistrarItens> itens = [];

  void registrarItem() {
    int? qtd = int.tryParse(quantidadeItem.text);

    if (qtd != null && nomeItem.text.isNotEmpty) {
      setState(() {
        itens.add(RegistrarItens(
          nome: nomeItem.text,
          quantidade: qtd,
        ));
        nomeItem.clear();
        quantidadeItem.clear();
      });
    }
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: nomeItem,
                  decoration: InputDecoration(labelText: "Nome do Item"),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: quantidadeItem,
                  decoration: InputDecoration(labelText: "Quantidade"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: registrarItem,
                  child: Text("Salvar Item"),
                ),
                SizedBox(height: 30),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: itens.length,
                  itemBuilder: (context, index) {
                    final item = itens[index];
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: ListTile(
                        title: Text(item.nome),
                        subtitle: Text("Quantidade: ${item.quantidade}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              value: item.comprado,
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
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
