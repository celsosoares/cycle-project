import 'package:flutter/material.dart';

class PurchaseDetailPage extends StatelessWidget {
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

  PurchaseDetailPage({
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
        title: Text('Compra#$donationId'),
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
                  status: 'Pedido\nconfirmado',
                  isCompleted: true,
                ),
                _buildStatusItem(
                  status: 'Pagamento\nefetuado',
                  isCompleted: false,
                ),
                _buildStatusItem(
                  status: 'Pedido \nrecebido',
                  isCompleted: false,
                ),
              ],
            ),
            SizedBox(height: 40),
            _buildDetailsContainer('Detalhes do pedido', [
              _buildDetailRow('Pagamento efetuado', '07/02/2024 às 13:39'),
              _buildDetailRow('Pedido confirmado', '07/02/2024 às 13:39'),
            ]),
            SizedBox(height: 40),
            _buildDetailsContainer('Endereço de entrega', [
              Row(
                children: [
                  Image.network(
                    'images/maps.png',
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rua Fulano de Tal, Madalena',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 4),
                        Text('105, apto 201',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 131, 130, 129))),
                        SizedBox(height: 4),
                        Text('Recife, Pernambuco, 50000-000'),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(height: 40),
            _buildDetailsContainer('Informaçoes dos produtos', [
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
                        Text('RS29,90',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 131, 130, 129))),
                        SizedBox(height: 4),
                        Text('Lorena Silva'),
                      ],
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(height: 40),
            _buildDetailsContainer('Metodo de pagamento', [
              _buildDetailRow('Pix', ''),
            ]),
            SizedBox(height: 40),
            _buildDetailsContainer('Detalhes do pagamento', [
              SizedBox(height: 16),
              _buildDetailRow('Subtotal dos produtos', materialName),
              _buildDetailRow('Quantos pontos deseja usar', categorias),
              _buildDetailRow('Desconto por pontos', '$pontosRendidos'),
              _buildDetailRow('Pagamento total', '$quantidade'),
            ]),
            SizedBox(height: 40),
            Center(
                child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              ),
              child: Text(
                "Confirmar recebimento",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ))
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
