import 'dart:io';
import 'package:flutter/material.dart';

class Produto {
  final String title;
  final String nome;
  final String descricao;
  final double preco;
  final double avaliacao;
  final int vendidos;
  final int pontosDesigner;
  final List<String> imagens;

  Produto({
    required this.title,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.avaliacao,
    required this.vendidos,
    required this.pontosDesigner,
    required this.imagens,
  });
}

class Designer {
  final String nome;
  final String bio;
  final String foto;

  Designer({
    required this.nome,
    required this.bio,
    required this.foto,
  });
}

class ProductPage extends StatefulWidget {
  static const routeName = '/BuyProduct';
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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

  int imagemSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                produto.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              produto.imagens[imagemSelecionada],
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List.generate(produto.imagens.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                imagemSelecionada = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: imagemSelecionada == index
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(produto.imagens[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'R\$ ${produto.preco.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${produto.vendidos} vendidos',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(
                            produto.avaliacao.toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Você possui ${produto.pontosDesigner} pontos nesse designer',
                        style:
                            const TextStyle(fontSize: 14, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                produto.nome,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Sobre o Produto',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                produto.descricao,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              const SizedBox(height: 16),
              Text(
                'Informações do artista',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Card(
                color: const Color.fromARGB(255, 128, 211, 117),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(designer.foto),
                        radius: 30,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              designer.nome,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              designer.bio,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chat_outlined),
                    onPressed: () {
                      // Ação do ícone de balão de fala
                    },
                  ),
                  const VerticalDivider(
                    color: Colors.grey, // Cor da linha
                    thickness: 1, // Espessura da linha
                    width: 1, // Largura da linha
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      // Ação do ícone de sacola de compras
                    },
                  ),
                ],
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
                    Navigator.popAndPushNamed(context, '/ConfirmBuying');
                  },
                  child: const Text(
                    'Compre agora',
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
