import 'package:cycle_project/pages/points/last_donations.dart';
import 'package:cycle_project/pages/points/last_purchases.dart';
import 'package:cycle_project/pages/points/points_list.dart';
import 'package:flutter/material.dart';

class PessoaDetailPage extends StatelessWidget {
  final Pessoa pessoa;

  const PessoaDetailPage({Key? key, required this.pessoa}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[200],
                child: Image.network('images/avatar.png',
                    width: 130, height: 130, fit: BoxFit.cover)),
            SizedBox(height: 15),
            Text(
              '${pessoa.nome} ${pessoa.sobrenome}',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Text(
              '${pessoa.pontos} pontos',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            Text(
              'Pontos pendentes: ${pessoa.pontosPendentes}',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UltimasDoacoesPage(
                          pontosGanhos: pessoa.pontos,
                          pontosAtuais: pessoa.pontos,
                          pontosPendentes: 0,
                        ),
                      ),
                    );
                  },
                  child: _buildCard(
                    icon: Image.asset(
                      'images/last_donations.png',
                      width: 130,
                      height: 130,
                    ),
                    title: 'Veja suas últimas doações',
                    value: pessoa.doacoes,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UltimasComprasPage(
                          pontosGastos: pessoa.pontos,
                        ),
                      ),
                    );
                  },
                  child: _buildCard(
                    icon: Image.asset(
                      'images/last_purchases.png',
                      width: 130,
                      height: 130,
                    ),
                    title: 'Veja suas últimas compras',
                    value: pessoa.compras,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required Widget icon,
    required String title,
    required int value,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            icon,
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('$value', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
