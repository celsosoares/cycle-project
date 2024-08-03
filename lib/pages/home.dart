import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const routeName = '/HomePage';
  final List<Product> products = [
    Product(
        'Camisa preta', 'R\$29,90', 'Lorena Silva', 5, 'images/clothes.png'),
    Product(
        'Acessorios', 'R\$45,00', 'Camila Souza', 5, 'images/accessories.png'),
    Product('Sapatos', 'R\$35,00', 'Camila Souza', 5, 'images/shoes.png'),
    Product('Guarda-chuva', 'R\$40,00', 'Camila Souza', 5, 'images/bags.png'),
    Product('Pneu', 'R\$40,00', 'Camila Souza', 5, 'images/google.png'),
    Product('Decoração', 'R\$40,00', 'Camila Souza', 5, 'images/furniture.png'),
    Product('Prato', 'R\$40,00', 'Camila Souza', 5, 'images/crafts.png'),
    Product('Maça', 'R\$40,00', 'Camila Souza', 5, 'images/apple.png'),
    Product('Porta', 'R\$40,00', 'Camila Souza', 5, 'images/utensils.png'),
    Product('Televisão', 'R\$40,00', 'Camila Souza', 5, 'images/facebook.png'),
    // Adicione outros produtos seguindo a mesma estrutura
  ];

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
        child: Container(
          height: 400, // Defina a altura desejada para o card
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  side:
                      BorderSide(color: Colors.black), // Defina a cor da borda
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Image.network(products[index]
                      .image), // Substitua pela URL real da imagem
                  title: Text(products[index].name),
                  subtitle: Text(products[index].seller),
                  trailing: Column(
                    children: <Widget>[
                      Text(products[index].price),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children:
                            List.generate(5, (i) => Icon(Icons.star_border)),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
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

class Product {
  String name;
  String price;
  String seller;
  int rating;
  String image;

  // Adicione imageUrl se você tiver imagens hospedadas online.
  // String imageUrl;

  Product(this.name, this.price, this.seller, this.rating, this.image);
}
