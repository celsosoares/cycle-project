import 'package:cycle_project/pages/points/donation_detail_page.dart';
import 'package:flutter/material.dart';

class UltimasDoacoesPage extends StatelessWidget {
  final int pontosGanhos;
  final int pontosAtuais;
  final int pontosPendentes;

  const UltimasDoacoesPage({
    Key? key,
    required this.pontosGanhos,
    required this.pontosAtuais,
    required this.pontosPendentes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Últimas Doações'),
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
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTableCell(context, pontosGanhos, 'pontos ganhos'),
                VerticalDivider(
                  color: Colors.black,
                ),
                _buildTableCell(context, pontosAtuais, 'pontos atuais'),
                VerticalDivider(
                  color: Colors.black,
                ),
                _buildTableCell(context, pontosPendentes, 'pendentes'),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFilterButton(context, 'A ser entregue'),
                _buildFilterButton(context, 'A ser validado'),
                _buildFilterButton(context, 'Concluído'),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  _buildDonationCard(
                    context: context,
                    donationId: '5678',
                    profileName: 'Maria Oliveira',
                    status: 'Concluído',
                    pontos: 80,
                    ultimaAtualizacao: '06/02/2024 às 11:15',
                    imageUrl: 'images/shoes.png',
                  ),
                  SizedBox(height: 10),
                  _buildDonationCard(
                    context: context,
                    donationId: '1234',
                    profileName: 'João Silva',
                    status: 'A ser entregue',
                    pontos: 50,
                    ultimaAtualizacao: '05/02/2024 às 10:00',
                    imageUrl: 'images/bags.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCell(BuildContext context, int value, String label) {
    return Column(
      children: [
        Text(
          '$value',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildFilterButton(BuildContext context, String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      ),
      child: Text(label, style: TextStyle(fontSize: 16)),
    );
  }

  Widget _buildDonationCard({
    required BuildContext context,
    required String donationId,
    required String profileName,
    required String status,
    required int pontos,
    required String ultimaAtualizacao,
    required String imageUrl,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DonationDetailPage(
              donationId: donationId,
              itemName: 'Lençol',
              itemClass: 'Tecidos',
              pontosRendidos: pontos,
              materialName: 'Lençol',
              categorias: 'Tecidos',
              quantidade: 2,
              condicao: 'Boas condições',
              observacoes: 'Uma das pontas está rasgada',
              pontosAGanhar: pontos,
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.network(imageUrl,
                  width: 110, height: 110, fit: BoxFit.cover),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doação #$donationId',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      profileName,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status da doação: $status',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Pontos: $pontos',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Última atualização: $ultimaAtualizacao',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
