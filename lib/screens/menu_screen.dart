import 'package:app_estudo_flutter/screens/desafios/desafios_sreen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Opções',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.radio_button_checked),
              title: Text('Botões'),
              onTap: () {
                // Navegar ou fazer algo
                Navigator.pushNamed(context, 'botoes');
              },
            ),
            ListTile(
              leading: Icon(Icons.shield),
              title: Text('Desafios'),
              onTap: () {
                // Navegar ou fazer algo
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DesafiosSreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                // Navegar ou fazer algo
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
                // Lógica de logout
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Conteúdo da Tela'),
      ),
    );
  }
}
