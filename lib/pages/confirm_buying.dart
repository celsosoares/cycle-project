import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cycle_project/pages/buying_product.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ConfirmBuying extends StatefulWidget {
  static const routeName = '/ConfirmBuying';
  const ConfirmBuying({super.key});

  @override
  State<ConfirmBuying> createState() => _ConfirmBuyingState();
}

class _ConfirmBuyingState extends State<ConfirmBuying> {
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
      'images/camisa.png',
      'images/camisa.png',
      'images/camisa.png',
    ],
  );

  final Designer designer = Designer(
    nome: 'Lorena Silva',
    bio:
        'Transformando materiais descartados em peças de moda únicas e conscientes! ✨🌿 Designer de moda e defensora do upcycling. Explore minha coleção exclusiva de roupas e acessórios feitos à mão, cada um contando sua própria história de renovação e sustentabilidade.',
    foto: 'images/Avatar.png',
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

  String selectedPaymentMethod = 'Crédito';
  int imagemSelecionada = 0;
  int quantidade = 1;

  int pontosUsados = 0;
  double desconto = 0.0;

  void _selectPaymentMethod() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(paymentMethod.credit),
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = paymentMethod.credit;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(paymentMethod.debit),
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = paymentMethod.debit;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(paymentMethod.pix),
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = paymentMethod.pix;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _calculateDiscount(int points) {
    setState(() {
      pontosUsados = points;
      desconto =
          (pontosUsados / 10).clamp(0, produto.pontosDesigner).toDouble();
    });
  }

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
                'Confirmar',
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
            const Text(
              'Endereço de entrega',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            // Card de endereço
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40, // Tamanho do lado da imagem
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      address.street,
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/Address');
                                    },
                                    child: const Text(
                                      'Mudar',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ),
                                ],
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
                  ],
                ),
              ),
            ),
            const Text(
              'Informações dos produtos',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

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
                        child: Image.asset(produto.imagens[0]),
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
                    TextButton(
                      onPressed: _selectPaymentMethod,
                      child: const Text(
                        'Mudar',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    const SizedBox(
                        width: 16.0), // Espaçamento final para o botão
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
                    Text(
                      'Você possui ${produto.pontosDesigner} pontos com esse designer',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal dos produtos'),
                        Text('R\$ ${subtotal.toStringAsFixed(2)}'),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Quantos pontos deseja usar'),
                        SizedBox(
                          width: 40,
                          height: 20,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              int points = int.tryParse(value) ?? 0;
                              _calculateDiscount(points);
                            },
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                            style: const TextStyle(
                                fontSize: 12,
                                height:
                                    1.0), // Ajuste do tamanho da fonte e altura da linha
                            maxLines: 1, // Limite de uma linha
                          ),
                        ),
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
            const Text(
              'Verifique se todas informações estão corretas',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [Text("Valor total"), Text("29,90")],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 128, 211, 117),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/ProductBrought');
                  },
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
