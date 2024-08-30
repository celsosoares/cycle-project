import 'package:cycle_project/pages/points/points_design_detais.dart';
import 'package:flutter/material.dart';

class PointsListPage extends StatelessWidget {
  PointsListPage({Key? key}) : super(key: key);
  static const routeName = '/PointsListPage';

  final List<Pessoa> pessoas = [
    Pessoa(
        nome: 'João',
        sobrenome: 'Silva',
        doacoes: 2,
        compras: 1,
        pontos: 120,
        pontosPendentes: 20),
    Pessoa(
        nome: 'Maria',
        sobrenome: 'Oliveira',
        doacoes: 5,
        compras: 3,
        pontos: 300,
        pontosPendentes: 50),
    Pessoa(
        nome: 'Carlos',
        sobrenome: 'Souza',
        doacoes: 1,
        compras: 2,
        pontos: 80,
        pontosPendentes: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Meus pontos'),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        ],
        onTap: (index) {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Designers que você tem pontos',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pessoas.length,
              itemBuilder: (context, index) {
                final pessoa = pessoas[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.network(
                          'images/avatar.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      '${pessoa.nome} ${pessoa.sobrenome}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${pessoa.doacoes} doações',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '${pessoa.compras} compras',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      '${pessoa.pontos} pontos',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              PessoaDetailPage(pessoa: pessoa),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Pessoa {
  final String nome;
  final String sobrenome;
  final int doacoes;
  final int compras;
  final int pontos;
  final int pontosPendentes;

  Pessoa({
    required this.nome,
    required this.sobrenome,
    required this.doacoes,
    required this.compras,
    required this.pontos,
    required this.pontosPendentes,
  });
}
