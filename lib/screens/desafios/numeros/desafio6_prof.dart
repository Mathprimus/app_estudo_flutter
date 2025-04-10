import 'package:flutter/material.dart';

class RegistrarFilme {
  final String nome;
  final int nota;
  bool assistido;

  RegistrarFilme({
    required this.nome,
    required this.nota,
    this.assistido = false,
  });
}

class Desafio6_prof extends StatefulWidget {
  const Desafio6_prof({super.key});

  @override
  State<Desafio6_prof> createState() => _Desafio6_profState();
}

class _Desafio6_profState extends State<Desafio6_prof> {
  TextEditingController nomeFilme = TextEditingController();
  TextEditingController notaFilme = TextEditingController();

  List<RegistrarFilme> filmes = [];

  void registrarFilme() {
    final nome = nomeFilme.text.trim();
    final notaTexto = notaFilme.text.trim();

    if (nome.isEmpty || notaTexto.isEmpty) {
      return;
    }

    final nota = int.tryParse(notaTexto);
    if (nota == null || nota < 0 || nota > 10) {
      return;
    }

    setState(() {
      filmes.add(RegistrarFilme(nome: nome, nota: nota));
      nomeFilme.clear();
      notaFilme.clear();
    });
  }

  void excluirFilme(int index) {
    setState(() {
      filmes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Desafio 6")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nomeFilme,
                      decoration: InputDecoration(labelText: "Nome do Filme"),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextField(
                      controller: notaFilme,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Nota do filme"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: registrarFilme,
                child: Text("Adicionar Filme"),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filmes.length,
                itemBuilder: (context, index) {
                  final filme = filmes[index];

                  Color corNota;
                  if (filme.nota > 7) {
                    corNota = Colors.blue;
                  } else if (filme.nota > 3) {
                    corNota = Colors.yellow;
                  } else {
                    corNota = Colors.red;
                  }

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text(filme.nome)),
                              Text("${filme.nota} / 10"),
                              SizedBox(width: 8),
                              Icon(Icons.star, color: corNota),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: filme.assistido,
                                onChanged: (newValue) {
                                  setState(() {
                                    filme.assistido = newValue!;
                                  });
                                },
                              ),
                              Text("Assistido"),
                              Spacer(),
                              IconButton(
                                onPressed: () => excluirFilme(index),
                                icon: Icon(Icons.delete),
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
