import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cycle_project/pages/buying_product.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart'; // Importando as classes necessárias

class ProductDelivery extends StatefulWidget {
  static const routeName = '/ProductDelivery';
  const ProductDelivery({super.key});

  @override
  State<ProductDelivery> createState() => _ProductDeliveryState();
}

class _ProductDeliveryState extends State<ProductDelivery> {
  final Produto produto = Produto(
    title: 'Camisa Preta',
    nome: 'Camisa Sustentável "Essência Negra" - Feita à Mão por Lorena Silva',
    descricao:
        'Esta é a camisa "Essência Negra", uma peça única e ecoconsciente criada por mim. Feita à mão com tecidos reciclados, esta camisa preta combina elegância com sustentabilidade. Cada detalhe, desde a escolha dos materiais até a costura final, reflete meu compromisso com a moda sustentável. Celebre seu estilo e faça uma escolha consciente com a camisa "Essência Negra".',
    preco: 22.90,
    avaliacao: 4.8,
    vendidos: 29,
    pontosDesigner: 100,
    imagens: [
      'https://via.placeholder.com/200',
      'https://via.placeholder.com/200',
      'https://via.placeholder.com/200',
    ],
  );

  final Designer designer = Designer(
    nome: 'Lorena Silva',
    bio:
        'Transformando materiais descartados em peças de moda únicas e conscientes! ✨🌿 Designer de moda e defensora do upcycling. Explore minha coleção exclusiva de roupas e acessórios feitos à mão, cada um contando sua própria história de renovação e sustentabilidade.',
    fotoUrl: 'https://via.placeholder.com/100',
  );

  final Address address = Address(
    street: 'Rua Fulano de Tal, Madalena',
    complement: '105, apto 201',
    cityStateZip: 'Recife, Pernambuco, 50000-000',
  );

  final PaymentMethod paymentMethod = PaymentMethod(
    credit: 'Crédito',
    debit: 'Débito',
    pix: 'Pix',
  );

  String selectedPaymentMethod = 'Pix'; // Método de pagamento fixo

  int imagemSelecionada = 0;
  int quantidade = 1; // Contador de quantidade inicial

  int pontosUsados = 100; // Pontos estáticos
  double desconto = 10.0; // Desconto fixo

  @override
  Widget build(BuildContext context) {
    final double subtotal = produto.preco * quantidade;
    final double total = subtotal - desconto;

    return Scaffold(
      backgroundColor: Colors.grey[200], // Background cinza bem claro
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/BuyProduct');
              },
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Compra #1823',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Card de status do pedido
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _StatusItem(
                      color: Colors.green,
                      text: 'Pedido confirmado',
                      isCompleted: true,
                    ),
                    _StatusItem(
                      color: Colors.green,
                      text: 'Pagamento efetuado',
                      isCompleted: true,
                    ),
                    _StatusItem(
                      color: Colors.orange,
                      text: 'Pedido recebido',
                      isCompleted: false,
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Detalhes do pedido',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            // Card de detalhes do pedido
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Pagamento efetuado'),
                        Text('07/02/2024 às 13:39'),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Pedido confirmado'),
                        Text('07/02/2024 às 13:39'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              'Endereço de entrega',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            // Card de endereço
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 300, // Largura fixa para o Card
                height: 80, // Altura fixa para o Card
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 40, // 1/4 do Card (tamanho do lado da imagem)
                        height: 40,
                        color: Colors.grey, // Placeholder para a imagem
                        child: const Icon(Icons.location_on,
                            size: 30, color: Colors.white),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              address.street,
                              style: const TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 1.0),
                            Text(
                              address.complement,
                              style: const TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 1.0),
                            Text(
                              address.cityStateZip,
                              style: const TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              'Informações dos produtos',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            // Segundo card com a primeira imagem do produto e contador de quantidade
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 300,
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.network(
                          produto
                              .imagens[0], // Substituindo o ícone pela imagem
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 14.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              produto.title,
                              style: const TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              'R\$ ${produto.preco.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(height: 2.0),
                            Text(
                              designer.nome,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Contador de quantidade
                      Text(
                        'X$quantidade',
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              'Método de pagamento',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            // Card de método de pagamento
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 300,
                height: 40,
                child: Row(
                  children: [
                    const SizedBox(
                        width: 16.0), // Espaçamento inicial para o texto
                    Text(
                      selectedPaymentMethod,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            const Text(
              'Detalhes do pagamento',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            // Card de pontos e resumo financeiro
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal dos produtos'),
                        Text('R\$ ${subtotal.toStringAsFixed(2)}'),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Quantos pontos foram usados"),
                        Text('100')
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Descontos por pontos'),
                        Text('- R\$ ${desconto.toStringAsFixed(2)}'),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Pagamento total',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('R\$ ${total.toStringAsFixed(2)}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.all(12.0),
            ),
            onPressed: () {
              // Navegar para a tela ProductBrought após a compra
              Navigator.pushNamed(context, '/HomePage');
            },
            child: const Text(
              'Confirmar Recebimento',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final Color color;
  final String text;
  final bool isCompleted;

  const _StatusItem({
    required this.color,
    required this.text,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: isCompleted ? color : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: isCompleted
              ? Icon(Icons.check, color: Colors.white, size: 16)
              : null,
        ),
        const SizedBox(width: 8.0),
        Text(text),
        const SizedBox(width: 16.0),
      ],
    );
  }
}

class Address {
  final String street;
  final String complement;
  final String cityStateZip;

  Address({
    required this.street,
    required this.complement,
    required this.cityStateZip,
  });
}

class PaymentMethod {
  final String credit;
  final String debit;
  final String pix;

  PaymentMethod({
    required this.credit,
    required this.debit,
    required this.pix,
  });
}
