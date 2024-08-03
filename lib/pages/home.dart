import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, Vinícius'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).pushNamed('/sign-in');
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text('Meus pontos'), // Substitua pelo nome do usuário
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              child: Column(
                children: [
                  Image.asset('images/luffy.jpg',
                      fit: BoxFit.contain), // Substitua pelo caminho da imagem
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Conteúdo do card',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            // Outros widgets aqui
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.grey[850],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          // Adicione mais itens conforme necessário
        ],
      ),
    );
  }
}
