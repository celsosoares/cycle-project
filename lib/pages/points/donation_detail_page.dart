import 'package:flutter/material.dart';

class DonationDetailPage extends StatelessWidget {
  final String donationId;
  final String itemName;
  final String itemClass;
  final int pontosRendidos;
  final String materialName;
  final String categorias;
  final int quantidade;
  final String condicao;
  final String observacoes;
  final int pontosAGanhar;

  DonationDetailPage({
    required this.donationId,
    required this.itemName,
    required this.itemClass,
    required this.pontosRendidos,
    required this.materialName,
    required this.categorias,
    required this.quantidade,
    required this.condicao,
    required this.observacoes,
    required this.pontosAGanhar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doação#$donationId'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusItem(
                  status: 'Doação\nconfirmada',
                  isCompleted: true,
                ),
                _buildStatusItem(
                  status: 'Materiais\nentregues',
                  isCompleted: false,
                ),
                _buildStatusItem(
                  status: 'Validação do\ndesigner',
                  isCompleted: false,
                ),
              ],
            ),
            SizedBox(height: 40),
            _buildDetailsContainer('Detalhes do pedido', [
              _buildDetailRow('Doação confirmada', '07/02/2024 às 13:39'),
            ]),
            SizedBox(height: 40),
            _buildDetailsContainer('Detalhes dos materiais', [
              Row(
                children: [
                  Image.network(
                    'images/bags.png',
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22)),
                        SizedBox(height: 4),
                        Text('$itemClass',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 131, 130, 129))),
                        SizedBox(height: 4),
                        Text('Pontos: $pontosRendidos'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildDetailRow('Nome do material', materialName),
              _buildDetailRow('Categorias', categorias),
              _buildDetailRow('Pontos', '$pontosRendidos'),
              _buildDetailRow('Quantidade', '$quantidade'),
              _buildDetailRow('Condição do material', condicao),
              _buildDetailRow('Observações', observacoes),
            ]),
            SizedBox(height: 40),
            Text(
              'Você ganhará $pontosAGanhar pontos quando a doação for concluída',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.orange, fontSize: 25),
            ),
          ],
        ),
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
    );
  }

  Widget _buildStatusItem({required String status, required bool isCompleted}) {
    return Row(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? Colors.green : Colors.orange,
        ),
        SizedBox(width: 8),
        Text(
          status,
          style: TextStyle(
            color: isCompleted ? Colors.green : Colors.orange,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailsContainer(String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
