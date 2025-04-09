import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  String _selectedValue = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Botões de exemplo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [Text("Aqui temos o Elevated Button")],
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Confirmar'),
              ),
              SizedBox(height: 25),
              Row(
                children: [Text("Aqui temos o Text Button")],
              ),
              TextButton(
                onPressed: () {},
                child: Text('Cancelar'),
              ),
              SizedBox(height: 25),
              Row(
                children: [Text("Aqui temos o Outlined Button")],
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('Detalhes'),
              ),
              SizedBox(height: 25),
              Row(
                children: [Text("Aqui temos o Icon Button")],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
              ),
              SizedBox(height: 25),
              Row(
                children: [Text("Aqui temos o Dropdown Button")],
              ),
              DropdownButton<String>(
                value: _selectedValue,
                items: ['A', 'B', 'C'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue!;
                  });
                },
              ),
              SizedBox(height: 25),
              Row(
                children: [Text("Aqui temos o Cupertino Button")],
              ),
              CupertinoButton(
                onPressed: () {},
                child: Text('iOS Style'),
              ),
              SizedBox(height: 25),
              Row(
                children: [Text("Aqui temos o Popup Button")],
              ),
              PopupMenuButton<String>(
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return ['Editar', 'Excluir'].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [Text("Aqui temos o RawMaterial Button")],
              ),
              RawMaterialButton(
                onPressed: () {},
                fillColor: Colors.blue,
                shape: CircleBorder(),
                padding: EdgeInsets.all(16),
                child: Icon(Icons.star, color: Colors.white),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text("Aqui temos o InkWell sendo usado como Button")
                ],
              ),
              InkWell(
                onTap: () {
                  print('Tocou!');
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Clique aqui'),
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Text("Aqui na direita temos o FloatingAction Button")
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
