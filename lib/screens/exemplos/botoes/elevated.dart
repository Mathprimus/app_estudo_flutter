import 'package:flutter/material.dart';

class ElevatedScreen extends StatefulWidget {
  const ElevatedScreen({super.key});

  @override
  State<ElevatedScreen> createState() => _ElevatedScreenState();
}

class _ElevatedScreenState extends State<ElevatedScreen> {
  final List<Map<String, String>> properties = [
    {"autofocus": "Seleciona o botão como foco inicial automaticamente"},
    {"clipBehavior": "Define como o conteúdo será cortado"},
    {"enabled": "Indica se o botão está habilitado"},
    {"focusNode": "Permite usar um foco personalizado"},
    {"iconAlignment": "Controla o alinhamento de ícones"},
    {"isSemanticButton": "Define se será tratado como botão semântico"},
    {"onFocusChange": "Callback quando o foco muda"},
    {"onHover": "Callback ao passar o mouse"},
    {"onLongPress": "Callback ao pressionar e segurar"},
    {"onPressed": "Callback ao clicar (ação principal)"},
    {"statesController": "Gerencia o estado interativo do botão"},
    {"style": "Personaliza aparência: cor, forma, tamanho etc."},
    {"tooltip": "Texto ao passar o mouse"},
  ];

  final List<String> methods = [
    "createState() → cria o estado do botão",
    "defaultStyleOf(context) → estilo padrão baseado no tema",
    "themeStyleOf(context) → estilo definido no ElevatedButtonTheme",
    "toString(), toStringDeep() → debug e diagnóstico",
  ];

  final List<String> staticMethods = [
    "styleFrom() → estilo rápido com cor, shape, padding etc.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplos de ElevatedButton"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("📌 Propriedades",
                style: Theme.of(context).textTheme.titleLarge),
            ...properties.map((prop) {
              final key = prop.keys.first;
              final value = prop.values.first;
              return ListTile(
                title: Text(key),
                subtitle: Text(value),
                leading: Icon(Icons.code),
              );
            }),
            Divider(),
            Text("📦 Métodos", style: Theme.of(context).textTheme.titleLarge),
            ...methods.map((m) => ListTile(
                  title: Text(m),
                  leading: Icon(Icons.functions),
                )),
            Divider(),
            Text("🛠️ Métodos Estáticos",
                style: Theme.of(context).textTheme.titleLarge),
            ...staticMethods.map((m) => ListTile(
                  title: Text(m),
                  leading: Icon(Icons.build),
                )),
            Divider(thickness: 2),

            Text("🧪 Exemplos práticos",
                style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16),

            // 1. Botão básico
            Text("1. Básico"),
            ElevatedButton(
              onPressed: () {},
              child: Text("Clique aqui"),
            ),
            SizedBox(height: 16),

            // 2. Botão com estilo personalizado
            Text("2. Com cor de fundo e texto"),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: Text("Salvar"),
            ),
            SizedBox(height: 16),

            // 3. Botão com bordas arredondadas
            Text("3. Bordas arredondadas"),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Perfil"),
            ),
            SizedBox(height: 16),

            // 4. Botão com tamanho fixo
            Text("4. Tamanho fixo"),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Dimensões fixas"),
              ),
            ),
            SizedBox(height: 16),

            // 5. Botão com ícone
            Text("5. Com ícone"),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.send),
              label: Text("Enviar"),
            ),
            SizedBox(height: 16),

            // 6. Botão desabilitado
            Text("6. Desabilitado (onPressed null)"),
            ElevatedButton(
              onPressed: null,
              child: Text("Indisponível"),
            ),
            SizedBox(height: 16),

            // 7. Botão com sombra
            Text("7. Com sombra e elevação"),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 8,
                shadowColor: Colors.black,
              ),
              child: Text("Com sombra"),
            ),
            SizedBox(height: 16),

            // 8. Botão com padding interno customizado
            Text("8. Padding interno"),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              ),
              child: Text("Espaçado"),
            ),
            SizedBox(height: 16),

            // 9. Botão com borda colorida
            Text("9. Borda customizada"),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.red, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("Com borda"),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
